'use strict';

const fs = require('node:fs');
const path = require('node:path');
const { parseSource } = require('./xdev-doc-parser');

const ROOT = path.resolve(__dirname, '..');

const CATEGORIES = [
  { id: 'core', folder: 'Function-Core', name: 'Functions Core', group: 'RTL', description: 'Strings, numbers, dates, arrays and file operations.' },
  { id: 'gt', folder: 'Function-GT', name: 'Functions GT', group: 'RTL', description: 'Terminal settings and graphics-driver interfaces.' },
  { id: 'ct', folder: 'Function-CT', name: 'Functions CT', group: 'RTL', description: 'Additional utilities and text-window functions.' },
  { id: 'gfx', folder: 'Functions-GFX', name: 'Functions GFX', group: 'RTL', description: 'Graphics primitives: pixels, lines, shapes and screen access.' },
  { id: 'curl', folder: 'user-lib/curl', name: 'CURL', group: 'User libraries', description: 'HTTP and network transfer bindings.' },
  { id: 'fonts', folder: 'user-lib/fonts', name: 'Fonts', group: 'User libraries', description: 'Bitmap fonts and font-conversion resources.' },
  { id: 'gtglfw', folder: 'user-lib/gtglfw', name: 'GTGLFW', group: 'User libraries', description: 'GLFW terminal driver.' },
  { id: 'gtsdl3', folder: 'user-lib/gtsdl3', name: 'GTSDL3', group: 'User libraries', description: 'SDL3 terminal driver.' },
  { id: 'gtwvt', folder: 'user-lib/gtwvt', name: 'GTWVT', group: 'User libraries', description: 'Windows terminal driver.' },
  { id: 'gtxwc', folder: 'user-lib/gtxwc', name: 'GTXWC', group: 'User libraries', description: 'X11 terminal driver.' },
  { id: 'gui', folder: 'user-lib/gui', name: 'GUI', group: 'User libraries', description: 'Windows graphical user interface bindings.' },
  { id: 'hpdf', folder: 'user-lib/hpdf', name: 'HPDF', group: 'User libraries', description: 'PDF generation with libHaru.' },
  { id: 'json', folder: 'user-lib/json', name: 'JSON', group: 'User libraries', description: 'JSON parsing and serialization.' },
  { id: 'mytiff', folder: 'user-lib/mytiff', name: 'MyTiff', group: 'User libraries', description: 'Widget toolkit and application event handling.' },
  { id: 'openssl', folder: 'user-lib/openssl', name: 'OpenSSL', group: 'User libraries', description: 'Cryptography and TLS bindings.' },
  { id: 'qrcode', folder: 'user-lib/qrcode', name: 'QRCode', group: 'User libraries', description: 'QR code generation.' },
  { id: 'rdd', folder: 'Function-RDD', name: 'RDD', group: 'User libraries', description: 'Database areas, records and database-driver interfaces.' },
  { id: 'svg', folder: 'user-lib/svg', name: 'SVG', group: 'User libraries', description: 'SVG generation from xDev programs.' },
  { id: 'tui', folder: 'user-lib/tui', name: 'TUI', group: 'User libraries', description: 'Text user interface controls.' },
  { id: 'xml', folder: 'user-lib/xml', name: 'XML', group: 'User libraries', description: 'XML parsing and document operations.' },
  { id: 'zlib', folder: 'user-lib/zlib', name: 'Zlib', group: 'User libraries', description: 'Compression and decompression bindings.' },
  { id: 'classes', folder: 'Classes', name: 'Classes', group: 'Language', description: 'Class interfaces, methods and properties.' },
  { id: 'directives', folder: 'Directives', name: 'Directives', group: 'Language', description: 'Preprocessor directives and compile-time definitions.' },
  { id: 'operators', folder: 'Operators', name: 'Operators', group: 'Language', description: 'Expressions, comparisons and logical operations.' },
  { id: 'statements', folder: 'Statements', name: 'Statements', group: 'Language', description: 'Declarations, control flow and program structure.' },
];

function slug(value) {
  return (
    value
      .normalize('NFKD')
      .replace(/[\u0300-\u036f]/g, '')
      .toLowerCase()
      .replace(/[^a-z0-9_-]+/g, '-')
      .replace(/^-|-$/g, '') || 'entry'
  );
}

function toPosixPath(relativePath) {
  return relativePath.split(path.sep).join('/');
}

function encodePathSegments(relativePath) {
  return relativePath.split('/').map(encodeURIComponent).join('/');
}

const SOURCE_COLLECTIONS = [
  { id: 'examples', name: 'Examples', directory: 'examples' },
  { id: 'tests', name: 'Tests', directory: 'tests' },
];

function documentImages(root, sourcePath, sections, diagnostics) {
  const images = [];
  const names = (sections.IMAGE || '').split('\n').map((line) => line.trim()).filter(Boolean);

  for (const name of new Set(names)) {
    if (!/\.png$/i.test(name) || /[\\/:\x00-\x1f]/.test(name)) {
      diagnostics.push(`${sourcePath}: $IMAGE$ requires a PNG filename without a directory: ${name}`);
      continue;
    }

    const relativePath = toPosixPath(path.join(path.dirname(sourcePath), 'images', name));
    const filePath = path.join(root, relativePath);
    if (!fs.existsSync(filePath) || !fs.statSync(filePath).isFile()) {
      diagnostics.push(`${sourcePath}: $IMAGE$ file not found: ${relativePath}`);
      continue;
    }

    const imageDirectory = fs.realpathSync(path.dirname(filePath)) + path.sep;
    const outsideImages = !fs.realpathSync(filePath).startsWith(imageDirectory);
    const outsideProject = !imageDirectory.startsWith(fs.realpathSync(root) + path.sep);
    if (outsideImages || outsideProject) {
      diagnostics.push(`${sourcePath}: $IMAGE$ must stay inside its local images directory: ${name}`);
      continue;
    }

    const signature = fs.readFileSync(filePath).subarray(0, 8);
    if (!signature.equals(Buffer.from([137, 80, 78, 71, 13, 10, 26, 10]))) {
      diagnostics.push(`${sourcePath}: $IMAGE$ is not a PNG file: ${relativePath}`);
      continue;
    }

    images.push({ name, path: relativePath, url: encodePathSegments(relativePath) });
  }
  return images;
}

function buildSourceCollection(collection, root) {
  const files = [];
  const diagnostics = [];

  function walk(directory) {
    if (!fs.existsSync(directory)) {
      return;
    }

    for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
      const filePath = path.join(directory, entry.name);
      const relativePath = toPosixPath(path.relative(root, filePath));

      if (entry.isDirectory()) {
        walk(filePath);
        continue;
      }

      if (!entry.isFile()) {
        continue;
      }

      const isPrg = /\.prg$/i.test(entry.name);
      const isUtf8Demo = relativePath === 'examples/UTF-8-demo.txt';

      if (!isPrg && !isUtf8Demo) {
        continue;
      }

      const source = fs.readFileSync(filePath, 'utf8');
      const kind = isPrg ? 'prg' : 'text';
      const parsed = kind === 'prg'
        ? parseSource(source)
        : { documents: [], diagnostics: [] };

      for (const message of parsed.diagnostics) {
        diagnostics.push(`${relativePath}: ${message}`);
      }

      const document = parsed.documents[0];
      const sections = document?.sections || {};

      const reference = (sections.EXAMPLES || '')
        .trim()
        .replace(/\\/g, '/')
        .replace(/^\.\//, '');
      const ownSource =
        !reference || reference === relativePath || reference === entry.name;

      let example;
      if (!document) {
        example = source;
      } else if (ownSource) {
        example = document.sourceExample;
      } else {
        example = sections.EXAMPLES;
      }

      const viewPath = relativePath.replace(/\.[^/.]+$/, '.html');

      files.push({
        path: relativePath,
        name: relativePath.slice(collection.directory.length + 1),
        url: encodePathSegments(relativePath),
        viewPath,
        viewUrl: encodePathSegments(viewPath),
        title: sections.NAME || entry.name,
        summary: (sections.ONELINER || '').replace(/\s+/g, ' ').trim(),
        sections,
        images: documentImages(root, relativePath, sections, diagnostics),
        kind,
        source,
        example,
      });
    }
  }

  walk(path.join(root, collection.directory));

  files.sort((a, b) => a.name.localeCompare(b.name, 'en', { sensitivity: 'base' }));

  return {
    ...collection,
    url: `${collection.directory}/index.html`,
    files,
    diagnostics,
  };
}

function loadCatalog(root = ROOT) {
  const documents = [];
  const diagnostics = [];

  for (const category of CATEGORIES) {
    const directory = path.join(root, 'content', category.folder);

    if (!fs.existsSync(directory)) {
      continue;
    }

    const prgFiles = fs
      .readdirSync(directory)
      .filter((file) => file.toLowerCase().endsWith('.prg'))
      .sort();

    for (const file of prgFiles) {
      const source = fs.readFileSync(path.join(directory, file), 'utf8');

      const parsed = parseSource(source);

      if (!parsed.documents.length && !parsed.diagnostics.length) {
        parsed.diagnostics.push('No $DOC$ documentation block found.');
      }

      for (const message of parsed.diagnostics) {
        diagnostics.push(`${category.folder}/${file}: ${message}`);
      }

      parsed.documents.forEach((doc, index) => {
        const base = slug(path.basename(file, path.extname(file)));
        const id = index > 0 ? `${base}-${index + 1}` : base;
        const name = doc.sections.NAME || path.basename(file, '.prg');

        documents.push({
          ...doc,
          id,
          category: category.id,
          name,
          summary: (doc.sections.ONELINER || '').replace(/\s+/g, ' ').trim(),
          url: `reference/${category.id}/${id}.html`,
          sourceUrl: `content/${encodePathSegments(category.folder)}/${encodeURIComponent(file)}`,
          sourceFile: file,
          images: documentImages(root, `content/${category.folder}/${file}`, doc.sections, diagnostics),
        });
      });
    }
  }

  documents.sort((a, b) => a.name.localeCompare(b.name, 'en', { sensitivity: 'base' }));

  const categories = CATEGORIES.map((category) => ({
    ...category,
    count: documents.filter((doc) => doc.category === category.id).length,
    url: `reference/${category.id}/index.html`,
  }));

  const collections = SOURCE_COLLECTIONS.map((collection) => buildSourceCollection(collection, root));

  for (const collection of collections) {
    diagnostics.push(...collection.diagnostics);
  }

  const pageUrls = [
    'index.html',
    'reference/index.html',
    ...categories.map((category) => category.url),
    ...documents.map((doc) => doc.url),
  ];

  for (const collection of collections) {
    pageUrls.push(collection.url, ...collection.files.map((file) => file.viewUrl));
  }

  const usedUrls = new Set();
  for (const url of pageUrls) {
    if (usedUrls.has(url)) {
      throw new Error(`Duplicate documentation URL: ${url}`);
    }
    usedUrls.add(url);
  }

  const images = new Map();
  const entries = [
    ...documents,
    ...collections.flatMap((collection) => collection.files),
  ];
  for (const entry of entries) {
    for (const image of entry.images) {
      images.set(image.path, image);
    }
  }

  return {
    documents,
    categories,
    collections,
    images: [...images.values()],
    diagnostics,
  };
}

function publicCatalog(catalog) {
  return {
    categories: catalog.categories,
    documents: catalog.documents.map(({ name, summary, category, url }) => ({
      name,
      summary,
      category,
      url,
    })),
  };
}

module.exports = { ROOT, loadCatalog, publicCatalog };
