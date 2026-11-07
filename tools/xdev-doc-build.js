#!/usr/bin/env node
'use strict';

const fs = require('node:fs');
const path = require('node:path');
const { ROOT, loadCatalog, publicCatalog } = require('./xdev-doc-catalog');
const { renderPage } = require('./xdev-doc-site');

function buildSite({ root = ROOT, output = path.join(root, '.site') } = {}) {
  root = path.resolve(root); output = path.resolve(output);
  if (output !== path.join(root, '.site') || (fs.existsSync(output) && fs.lstatSync(output).isSymbolicLink())) {
    throw new Error('The generated site must be written to the regular .site directory inside the project.');
  }
  const catalog = loadCatalog(root);
  if (catalog.diagnostics.length) throw new Error(catalog.diagnostics.join('\n'));
  if (!catalog.documents.length) throw new Error('No documentation entries found.');
  fs.rmSync(output, { recursive: true, force: true });
  fs.mkdirSync(output, { recursive: true });
  const write = (relative, body) => {
    const target = path.join(output, relative);
    fs.mkdirSync(path.dirname(target), { recursive: true }); fs.writeFileSync(target, body, 'utf8');
  };
  const pages = [ { url: 'index.html', type: 'home' }, { url: 'reference/index.html', type: 'index' },
    ...catalog.collections.map(collection => ({ url: collection.url, type: 'collection', collection })),
    ...catalog.collections.flatMap(collection => collection.files.map(file => ({ url: file.viewPath, type: 'source', collection, file }))),
    ...catalog.categories.map(category => ({ url: category.url, type: 'category', category: category.id })),
    ...catalog.documents.map(document => ({ url: document.url, type: 'document', category: document.category, document })) ];
  for (const page of pages) write(page.url, renderPage(catalog, page, { prefix: '../'.repeat(page.url.split('/').length - 1) }));
  fs.cpSync(path.join(root, 'assets'), path.join(output, 'assets'), { recursive: true });
  write('assets/data/catalog.json', JSON.stringify(publicCatalog(catalog)));
  write('.nojekyll', '');
  for (const doc of catalog.documents) {
    const source = decodeURIComponent(doc.sourceUrl);
    const target = path.join(output, source);
    fs.mkdirSync(path.dirname(target), { recursive: true }); fs.copyFileSync(path.join(root, source), target);
  }
  for (const collection of catalog.collections) {
    for (const file of collection.files) {
      const target = path.join(output, file.path);
      fs.mkdirSync(path.dirname(target), { recursive: true });
      fs.copyFileSync(path.join(root, file.path), target);
    }
  }
  return { output, pages: pages.length, entries: catalog.documents.length };
}

if (require.main === module) {
  try {
    const result = buildSite();
    console.log(`Generated ${result.pages} pages from ${result.entries} documentation entries.\nOutput: ${result.output}`);
  } catch (error) { console.error(error.message); process.exitCode = 1; }
}

module.exports = { buildSite };
