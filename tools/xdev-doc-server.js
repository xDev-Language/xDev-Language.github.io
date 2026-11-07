#!/usr/bin/env node
'use strict';

const http = require('node:http');
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const { ROOT, loadCatalog, publicCatalog } = require('./xdev-doc-catalog');
const { renderPage } = require('./xdev-doc-site');

const WATCHED_DIRECTORIES = ['content', 'assets', 'examples', 'tests'];
const SNAPSHOT_TTL_MS = 500;

const MIME_TYPES = {
  '.css': 'text/css; charset=utf-8',
  '.js': 'text/javascript; charset=utf-8',
  '.svg': 'image/svg+xml',
  '.png': 'image/png',
  '.prg': 'text/plain; charset=utf-8',
  '.txt': 'text/plain; charset=utf-8',
};

function fileStamp(directory) {
  if (!fs.existsSync(directory)) {
    return '';
  }

  return fs
    .readdirSync(directory, { withFileTypes: true })
    .sort((a, b) => a.name.localeCompare(b.name))
    .map((entry) => {
      const filePath = path.join(directory, entry.name);

      if (entry.isDirectory()) {
        return fileStamp(filePath);
      }

      if (!entry.isFile()) {
        return '';
      }

      const stat = fs.statSync(filePath);
      return `${filePath}:${stat.mtimeMs}:${stat.ctimeMs}:${stat.size}`;
    })
    .join('|');
}

function computeStamp(root) {
  return WATCHED_DIRECTORIES.map((directory) =>
    fileStamp(path.join(root, directory)),
  ).join('|');
}

function sendResponse(request, response, status, body, contentType, extra) {
  const type = contentType ?? 'text/plain; charset=utf-8';
  const buffer = Buffer.isBuffer(body) ? body : Buffer.from(body);

  const etag = '"' + crypto.createHash('sha256').update(buffer).digest('hex') + '"';

  const headers = {
    'Content-Type': type,
    'Cache-Control': 'no-cache',
    'X-Content-Type-Options': 'nosniff',
    ETag: etag,
    ...extra,
  };

  if (status === 200 && request.headers['if-none-match'] === etag) {
    response.writeHead(304, headers);
    response.end();
    return;
  }

  response.writeHead(status, { ...headers, 'Content-Length': buffer.length });
  response.end(request.method === 'HEAD' ? undefined : buffer);
}

function createDocServer({ root = ROOT } = {}) {
  let state;
  let lastCheck = 0;

  function snapshot() {
    if (state && Date.now() - lastCheck < SNAPSHOT_TTL_MS) {
      return state;
    }

    lastCheck = Date.now();

    const stamp = computeStamp(root);

    if (!state || stamp !== state.stamp) {
      const catalog = loadCatalog(root);
      const version = crypto.createHash('sha256').update(stamp).digest('hex');

      state = { stamp, catalog, version, pages: new Map() };
    }

    return state;
  }

  function tryServeStaticAsset(request, response, pathname, catalog) {
    const isAssetPath = pathname.startsWith('/assets/');
    const isDocumentImage = catalog.images.some((image) => '/' + decodeURIComponent(image.url) === pathname);
    const isDocumentSource = catalog.documents.some((doc) => '/' + decodeURIComponent(doc.sourceUrl) === pathname);

    const isCollectionSource = catalog.collections.some((collection) =>
      collection.files.some((file) => '/' + decodeURIComponent(file.url) === pathname),
    );

    if (!isAssetPath && !isDocumentSource && !isCollectionSource && !isDocumentImage) {
      return false;
    }

    const filePath = path.resolve(root, '.' + pathname);
    const rootWithSep = path.resolve(root) + path.sep;

    if (!filePath.startsWith(rootWithSep)) {
      sendResponse(request, response, 403, 'Forbidden.');
      return true;
    }

    if (!fs.existsSync(filePath) || !fs.statSync(filePath).isFile()) {
      sendResponse(request, response, 404, 'File not found.');
      return true;
    }

    const extension = path.extname(filePath).toLowerCase();
    const contentType = MIME_TYPES[extension] ?? 'application/octet-stream';

    const extra = isDocumentSource
      ? {
          'Content-Disposition': `attachment; filename="${path.basename(filePath)}"`,
        }
      : undefined;

    sendResponse(request, response, 200, fs.readFileSync(filePath), contentType, extra);
    return true;
  }

  function resolvePage(route, catalog) {
    if (route === '/index.html') {
      return { type: 'home' };
    }

    if (route === '/reference/index.html') {
      return { type: 'index' };
    }

    for (const collection of catalog.collections) {
      if ('/' + collection.url === route) {
        return { type: 'collection', collection };
      }
      const file = collection.files.find(
        (candidate) => '/' + decodeURIComponent(candidate.viewUrl) === route,
      );
      if (file) {
        return { type: 'source', collection, file };
      }
    }

    const category = catalog.categories.find((item) => '/' + item.url === route);
    if (category) {
      return { type: 'category', category: category.id };
    }

    const document = catalog.documents.find((item) => '/' + item.url === route);
    if (document) {
      return { type: 'document', category: document.category, document };
    }

    return null;
  }

  function tryServePage(request, response, pathname, current) {
    const route = pathname.endsWith('/') ? pathname + 'index.html' : pathname;
    const { catalog } = current;

    const page = resolvePage(route, catalog);

    if (!page) {
      sendResponse(request, response, 404, 'Documentation page not found.');
      return;
    }

    if (!current.pages.has(route)) {
      const depth = route.slice(1).split('/').length - 1;

      current.pages.set(
        route,
        renderPage(catalog, page, {
          prefix: '../'.repeat(depth),
          live: true,
          version: current.version,
        }),
      );
    }

    sendResponse(request, response, 200, current.pages.get(route), 'text/html; charset=utf-8');
  }

  return http.createServer((request, response) => {
    try {
      if (request.method !== 'GET' && request.method !== 'HEAD') {
        sendResponse(request, response, 405, 'Method not allowed.', undefined, {
          Allow: 'GET, HEAD',
        });
        return;
      }

      let pathname;
      try {
        pathname = decodeURIComponent(new URL(request.url, 'http://localhost').pathname);
      } catch {
        sendResponse(request, response, 400, 'Invalid URL.');
        return;
      }

      const pathSegments = pathname.split('/');
      const hasBackslash = pathname.includes('\\');
      const hasNullByte = pathname.includes('\0');
      const hasDotDot = pathSegments.includes('..');

      if (hasBackslash || hasNullByte || hasDotDot) {
        sendResponse(request, response, 400, 'Invalid path.');
        return;
      }

      const current = snapshot();
      const { catalog } = current;

      if (pathname === '/__version') {
        sendResponse(request, response, 200, current.version);
        return;
      }

      if (pathname === '/assets/data/catalog.json') {
        sendResponse(
          request,
          response,
          200,
          JSON.stringify(publicCatalog(catalog)),
          'application/json; charset=utf-8',
        );
        return;
      }

      if (tryServeStaticAsset(request, response, pathname, catalog)) {
        return;
      }

      tryServePage(request, response, pathname, current);
    } catch (error) {
      console.error(error.message);
      sendResponse(
        request,
        response,
        500,
        'The documentation could not be loaded. Check the server console.',
      );
    }
  });
}

if (require.main === module) {
  const port = Number(process.argv[2] || process.env.PORT || '3000');

  if (!Number.isInteger(port) || port < 1 || port > 65535) {
    console.error('Usage: node tools/xdev-doc-server.js [port: 1–65535]');
    process.exitCode = 1;
  } else {
    const server = createDocServer();

    server.on('error', (error) => {
      console.error(error.message);
      process.exitCode = 1;
    });

    server.listen(port, '127.0.0.1', () => {
      console.log(
        `xDev Documentation: http://localhost:${port}\n` +
          `Source: ${path.join(ROOT, 'content')}\n` +
          'Press Ctrl+C to stop.',
      );
    });
  }
}

module.exports = { createDocServer };
