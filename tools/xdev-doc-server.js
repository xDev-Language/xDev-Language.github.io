#!/usr/bin/env node
'use strict';

const http = require('node:http');
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const { ROOT, loadCatalog, publicCatalog } = require('./xdev-doc-catalog');
const { renderPage } = require('./xdev-doc-site');

function fileStamp(directory) {
  if (!fs.existsSync(directory)) return '';
  return fs.readdirSync(directory, { withFileTypes: true }).sort((a, b) => a.name.localeCompare(b.name)).map(entry => {
    const file = path.join(directory, entry.name);
    if (entry.isDirectory()) return fileStamp(file);
    if (!entry.isFile()) return '';
    const stat = fs.statSync(file);
    return `${file}:${stat.mtimeMs}:${stat.ctimeMs}:${stat.size}`;
  }).join('|');
}

function createDocServer({ root = ROOT } = {}) {
  let state; let lastCheck = 0;
  function snapshot() {
    if (state && Date.now() - lastCheck < 500) return state;
    lastCheck = Date.now();
    const stamp = ['content', 'assets', 'examples', 'tests'].map(directory => fileStamp(path.join(root, directory))).join('|');
    if (!state || stamp !== state.stamp) {
      const catalog = loadCatalog(root);
      const version = crypto.createHash('sha256').update(stamp).digest('hex');
      state = { stamp, catalog, version, pages: new Map() };
    }
    return state;
  }
  return http.createServer((request, response) => {
    function send(status, body, contentType = 'text/plain; charset=utf-8', extra = {}) {
      const buffer = Buffer.isBuffer(body) ? body : Buffer.from(body);
      const etag = '"' + crypto.createHash('sha256').update(buffer).digest('hex') + '"';
      const headers = { 'Content-Type': contentType, 'Cache-Control': 'no-cache', 'X-Content-Type-Options': 'nosniff', ETag: etag, ...extra };
      if (status === 200 && request.headers['if-none-match'] === etag) {
        response.writeHead(304, headers); response.end(); return;
      }
      response.writeHead(status, { ...headers, 'Content-Length': buffer.length });
      response.end(request.method === 'HEAD' ? undefined : buffer);
    }
    try {
      if (!['GET', 'HEAD'].includes(request.method)) return send(405, 'Method not allowed.', undefined, { Allow: 'GET, HEAD' });
      let pathname;
      try { pathname = decodeURIComponent(new URL(request.url, 'http://localhost').pathname); }
      catch { return send(400, 'Invalid URL.'); }
      if (pathname.includes('\\') || pathname.includes('\0') || pathname.split('/').includes('..')) return send(400, 'Invalid path.');
      const current = snapshot(); const { catalog } = current;
      if (pathname === '/__version') return send(200, current.version);
      if (pathname === '/assets/data/catalog.json') return send(200, JSON.stringify(publicCatalog(catalog)), 'application/json; charset=utf-8');
      const collectionSource = catalog.collections.some(collection => collection.files.some(file => '/' + decodeURIComponent(file.url) === pathname));
      if (pathname.startsWith('/assets/') || pathname.startsWith('/content/') || collectionSource) {
        if (pathname.startsWith('/content/') && !catalog.documents.some(doc => '/' + decodeURIComponent(doc.sourceUrl) === pathname)) return send(404, 'Source not found.');
        const file = path.resolve(root, '.' + pathname);
        if (!file.startsWith(path.resolve(root) + path.sep)) return send(403, 'Forbidden.');
        if (!fs.existsSync(file) || !fs.statSync(file).isFile()) return send(404, 'File not found.');
        const types = { '.css': 'text/css; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.svg': 'image/svg+xml', '.prg': 'text/plain; charset=utf-8', '.txt': 'text/plain; charset=utf-8', '.woff': 'font/woff' };
        const extra = pathname.startsWith('/content/') ? { 'Content-Disposition': `attachment; filename="${path.basename(file)}"` } : {};
        return send(200, fs.readFileSync(file), types[path.extname(file).toLowerCase()] || 'application/octet-stream', extra);
      }
      const route = pathname.endsWith('/') ? pathname + 'index.html' : pathname;
      let page;
      if (route === '/index.html') page = { type: 'home' };
      else if (route === '/reference/index.html') page = { type: 'index' };
      else {
        const collection = catalog.collections.find(item => '/' + item.url === route);
        const sourceCollection = catalog.collections.find(item => item.files.some(file => '/' + decodeURIComponent(file.viewUrl) === route));
        const category = catalog.categories.find(item => '/' + item.url === route);
        const document = catalog.documents.find(item => '/' + item.url === route);
        if (collection) page = { type: 'collection', collection };
        else if (sourceCollection) page = { type: 'source', collection: sourceCollection, file: sourceCollection.files.find(file => '/' + decodeURIComponent(file.viewUrl) === route) };
        else if (category) page = { type: 'category', category: category.id };
        else if (document) page = { type: 'document', category: document.category, document };
        else return send(404, 'Documentation page not found.');
      }
      if (!current.pages.has(route)) current.pages.set(route, renderPage(catalog, page, {
        prefix: '../'.repeat(route.slice(1).split('/').length - 1), live: true, version: current.version
      }));
      send(200, current.pages.get(route), 'text/html; charset=utf-8');
    } catch (error) {
      console.error(error.message);
      send(500, 'The documentation could not be loaded. Check the server console.');
    }
  });
}

if (require.main === module) {
  const argument = process.argv[2] || process.env.PORT || '3000';
  const port = Number(argument);
  if (!Number.isInteger(port) || port < 1 || port > 65535) {
    console.error('Usage: node tools/xdev-doc-server.js [port: 1–65535]'); process.exitCode = 1;
  } else {
    const server = createDocServer();
    server.on('error', error => { console.error(error.message); process.exitCode = 1; });
    server.listen(port, '127.0.0.1', () => console.log(`xDev Documentation: http://localhost:${port}\nSource: ${path.join(ROOT, 'content')}\nPress Ctrl+C to stop.`));
  }
}

module.exports = { createDocServer };
