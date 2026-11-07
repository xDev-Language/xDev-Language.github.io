'use strict';

const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const { parseSource } = require('./xdev-doc-parser');

const ROOT = path.resolve(__dirname, '..');
const CATEGORIES = [
  { id: 'core', folder: 'Function core', name: 'Functions core', group: 'RTL', description: 'Strings, numbers, dates, arrays and file operations.' },
  { id: 'gt', folder: 'Function GT', name: 'Functions GT', group: 'RTL', description: 'Terminal settings and graphics-driver interfaces.' },
  { id: 'ct', folder: 'Function CT', name: 'Functions CT', group: 'RTL', description: 'Additional utilities and text-window functions.' },
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
  { id: 'rdd', folder: 'Function RDD', name: 'RDD', group: 'User libraries', description: 'Database areas, records and database-driver interfaces.' },
  { id: 'svg', folder: 'user-lib/svg', name: 'SVG', group: 'User libraries', description: 'SVG generation from xDev programs.' },
  { id: 'tui', folder: 'user-lib/tui', name: 'TUI', group: 'User libraries', description: 'Text user interface controls.' },
  { id: 'xml', folder: 'user-lib/xml', name: 'XML', group: 'User libraries', description: 'XML parsing and document operations.' },
  { id: 'zlib', folder: 'user-lib/zlib', name: 'Zlib', group: 'User libraries', description: 'Compression and decompression bindings.' },
  { id: 'classes', folder: 'Classes', name: 'Classes', group: 'Language', description: 'Class interfaces, methods and properties.' },
  { id: 'commands', folder: 'Commands', name: 'Commands', group: 'Language', description: 'Database, file and environment commands.' },
  { id: 'directives', folder: 'Directives', name: 'Directives', group: 'Language', description: 'Preprocessor directives and compile-time definitions.' },
  { id: 'operators', folder: 'Operators', name: 'Operators', group: 'Language', description: 'Expressions, comparisons and logical operations.' },
  { id: 'statements', folder: 'Statements', name: 'Statements', group: 'Language', description: 'Declarations, control flow and program structure.' }
];

function slug(value) {
  return value.normalize('NFKD').replace(/[\u0300-\u036f]/g, '').toLowerCase()
    .replace(/[^a-z0-9_-]+/g, '-').replace(/^-|-$/g, '') || 'entry';
}

function sourceCollections(root) {
  return [
    { id: 'examples', name: 'Examples', directory: 'examples' },
    { id: 'tests', name: 'Tests', directory: 'tests' },
    { id: 'rosetta-code', name: 'Rosetta Code', directory: 'examples/rosetta-code' }
  ].map(collection => {
    const files = []; const diagnostics = [];
    function walk(directory) {
      if (!fs.existsSync(directory)) return;
      for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
        const file = path.join(directory, entry.name);
        if (entry.isDirectory()) {
          if (collection.id !== 'examples' || path.relative(root, file).split(path.sep).join('/') !== 'examples/rosetta-code') walk(file);
        }
        else if (entry.isFile()) {
          const relative = path.relative(root, file).split(path.sep).join('/');
          if (!/\.prg$/i.test(entry.name) && relative !== 'examples/UTF-8-demo.txt') continue;
          const source = fs.readFileSync(file, 'utf8');
          const kind = /\.prg$/i.test(entry.name) ? 'prg' : 'text';
          const parsed = kind === 'prg' ? parseSource(source) : { documents: [], diagnostics: [] };
          diagnostics.push(...parsed.diagnostics.map(message => `${relative}: ${message}`));
          const document = parsed.documents[0];
          const sections = document?.sections || {};
          const reference = (sections.EXAMPLES || '').trim().replace(/\\/g, '/').replace(/^\.\//, '');
          const ownSource = !reference || reference === relative || reference === entry.name;
          const viewPath = relative.replace(/\.[^/.]+$/, '.html');
          files.push({ path: relative, name: relative.slice(collection.directory.length + 1),
            url: relative.split('/').map(encodeURIComponent).join('/'), viewPath,
            viewUrl: viewPath.split('/').map(encodeURIComponent).join('/'),
            title: sections.NAME || entry.name, summary: (sections.ONELINER || '').replace(/\s+/g, ' ').trim(),
            sections, kind, source, example: document ? (ownSource ? document.sourceExample : sections.EXAMPLES) : source });
        }
      }
    }
    walk(path.join(root, collection.directory));
    files.sort((a, b) => a.name.localeCompare(b.name, 'en', { sensitivity: 'base' }));
    return { ...collection, url: `${collection.directory}/index.html`, files, diagnostics };
  });
}

function loadCatalog(root = ROOT) {
  const documents = []; const diagnostics = []; const sourceParts = [];
  for (const category of CATEGORIES) {
    const directory = path.join(root, 'content', category.folder);
    if (!fs.existsSync(directory)) continue;
    const files = fs.readdirSync(directory).filter(file => file.toLowerCase().endsWith('.prg')).sort();
    for (const file of files) {
      const source = fs.readFileSync(path.join(directory, file), 'utf8');
      sourceParts.push(category.id, file, source);
      const parsed = parseSource(source);
      if (!parsed.documents.length && !parsed.diagnostics.length) parsed.diagnostics.push('No $DOC$ documentation block found.');
      diagnostics.push(...parsed.diagnostics.map(message => `${category.folder}/${file}: ${message}`));
      parsed.documents.forEach((doc, index) => {
        const base = slug(path.basename(file, path.extname(file)));
        const id = index ? `${base}-${index + 1}` : base;
        documents.push({ ...doc, id, category: category.id, name: doc.sections.NAME || path.basename(file, '.prg'),
          summary: (doc.sections.ONELINER || '').replace(/\s+/g, ' ').trim(),
          url: `reference/${category.id}/${id}.html`,
          sourceUrl: `content/${category.folder.split('/').map(encodeURIComponent).join('/')}/${encodeURIComponent(file)}`, sourceFile: file });
      });
    }
  }
  const urls = new Set();
  for (const doc of documents) {
    if (urls.has(doc.url)) throw new Error(`Duplicate documentation URL: ${doc.url}`);
    urls.add(doc.url);
  }
  documents.sort((a, b) => a.name.localeCompare(b.name, 'en', { sensitivity: 'base' }));
  const categories = CATEGORIES.map(category => ({ ...category,
    count: documents.filter(doc => doc.category === category.id).length, url: `reference/${category.id}/index.html` }));
  const collections = sourceCollections(root);
  diagnostics.push(...collections.flatMap(collection => collection.diagnostics));
  const pageUrls = new Set(['index.html', 'reference/index.html', ...categories.map(category => category.url), ...urls]);
  for (const collection of collections) {
    for (const url of [collection.url, ...collection.files.map(file => file.viewUrl)]) {
      if (pageUrls.has(url)) throw new Error(`Duplicate documentation URL: ${url}`);
      pageUrls.add(url);
    }
  }
  return { documents, categories, collections, diagnostics,
    version: crypto.createHash('sha256').update(sourceParts.join('\0')).digest('hex').slice(0, 20) };
}

function publicCatalog(catalog) {
  return { categories: catalog.categories, documents: catalog.documents.map(({ name, summary, category, url }) =>
    ({ name, summary, category, url })) };
}

module.exports = { ROOT, CATEGORIES, loadCatalog, publicCatalog, slug };
