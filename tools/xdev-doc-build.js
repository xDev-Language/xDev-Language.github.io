#!/usr/bin/env node
'use strict';

const fs = require('node:fs');
const path = require('node:path');
const { ROOT, loadCatalog, publicCatalog } = require('./xdev-doc-catalog');
const { renderPage } = require('./xdev-doc-site');

function buildSite({ root = ROOT, output = path.join(root, '.site') } = {}) {
  const projectRoot = path.resolve(root);
  const outputDir = path.resolve(output);
  const defaultOutputDir = path.join(projectRoot, '.site');

  const outputExists = fs.existsSync(outputDir);
  const outputIsSymlink = outputExists && fs.lstatSync(outputDir).isSymbolicLink();

  if (outputDir !== defaultOutputDir || outputIsSymlink) {
    throw new Error(
      'The generated site must be written to the regular .site directory inside the project.',
    );
  }

  const catalog = loadCatalog(projectRoot);

  if (catalog.diagnostics.length > 0) {
    throw new Error(catalog.diagnostics.join('\n'));
  }

  if (catalog.documents.length === 0) {
    throw new Error('No documentation entries found.');
  }

  fs.rmSync(outputDir, { recursive: true, force: true });
  fs.mkdirSync(outputDir, { recursive: true });

  function writeFile(relativePath, contents) {
    const targetPath = path.join(outputDir, relativePath);

    fs.mkdirSync(path.dirname(targetPath), { recursive: true });
    fs.writeFileSync(targetPath, contents, 'utf8');
  }

  const pages = [
    { url: 'index.html', type: 'home' },
    { url: 'reference/index.html', type: 'index' },

    ...catalog.collections.map((collection) => ({
      url: collection.url,
      type: 'collection',
      collection,
    })),

    ...catalog.collections.flatMap((collection) =>
      collection.files.map((file) => ({
        url: file.viewPath,
        type: 'source',
        collection,
        file,
      })),
    ),

    ...catalog.categories.map((category) => ({
      url: category.url,
      type: 'category',
      category: category.id,
    })),

    ...catalog.documents.map((document) => ({
      url: document.url,
      type: 'document',
      category: document.category,
      document,
    })),
  ];

  for (const page of pages) {
    const depth = page.url.split('/').length - 1;
    const prefix = '../'.repeat(depth);

    writeFile(page.url, renderPage(catalog, page, { prefix }));
  }

  fs.cpSync(path.join(projectRoot, 'assets'), path.join(outputDir, 'assets'), {
    recursive: true,
  });

  writeFile('assets/data/catalog.json', JSON.stringify(publicCatalog(catalog)));
  writeFile('.nojekyll', '');

  const sourceFiles = [
    ...catalog.images.map((image) => image.path),
    ...catalog.documents.map((doc) => decodeURIComponent(doc.sourceUrl)),
    ...catalog.collections.flatMap((collection) => collection.files.map((file) => file.path)),
  ];

  for (const file of sourceFiles) {
    const targetPath = path.join(outputDir, file);
    fs.mkdirSync(path.dirname(targetPath), { recursive: true });
    fs.copyFileSync(path.join(projectRoot, file), targetPath);
  }

  return {
    output: outputDir,
    pages: pages.length,
    entries: catalog.documents.length,
  };
}

if (require.main === module) {
  try {
    const result = buildSite();

    console.log(
      `Generated ${result.pages} pages from ${result.entries} documentation entries.\nOutput: ${result.output}`,
    );
  } catch (error) {
    console.error(error.message);
    process.exitCode = 1;
  }
}

module.exports = { buildSite };
