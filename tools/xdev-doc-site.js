'use strict';

const { escapeHtml: esc, inlineMarkdown, highlightCode } = require('./xdev-doc-parser');

const icons = {
  copy: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" aria-hidden="true"><rect x="8" y="3" width="12" height="12" rx="2"/><rect x="3" y="8" width="12" height="12" rx="2" fill="var(--xdev-ink)"/></svg>',
  search: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" aria-hidden="true"><circle cx="10.5" cy="10.5" r="6.5"/><path d="m16 16 4 4"/></svg>',
  github: '<svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 .9A11.1 11.1 0 0 0 8.5 22.5c.6.1.8-.2.8-.5v-2c-3.4.7-4.1-1.4-4.1-1.4-.6-1.4-1.4-1.8-1.4-1.8-1.1-.7.1-.7.1-.7 1.2.1 1.8 1.2 1.8 1.2 1.1 1.8 2.8 1.3 3.6 1 .1-.8.4-1.3.8-1.6-2.7-.3-5.6-1.4-5.6-6.1 0-1.3.5-2.4 1.2-3.3-.1-.3-.5-1.6.2-3.3 0 0 1-.3 3.4 1.3a11.8 11.8 0 0 1 6.2 0C18 3.7 19 4 19 4c.7 1.7.3 3 .2 3.3.8.9 1.2 2 1.2 3.3 0 4.7-2.9 5.8-5.6 6.1.4.4.8 1.1.8 2.2V22c0 .3.2.6.8.5A11.1 11.1 0 0 0 12 .9Z"/></svg>',
};

const sectionNames = {
  SYNTAX: 'Syntax',
  ARGUMENTS: 'Arguments',
  RETURNS: 'Return value',
  DESCRIPTION: 'Description',
  NOTES: 'Notes',
  HEADER: 'Header',
  EXAMPLES: 'Example',
  OUTPUT: 'Output',
  IMAGE: 'Image',
  SEEALSO: 'See also',
};

const SIDEBAR_GROUPS = ['RTL', 'User libraries'];

const LOGO_EXAMPLE = `/*
 * xdev logo-xDev.prg
 */

#include "svg.ch"

PROCEDURE Main()

   LOCAL pSvg
   LOCAL nWidth := 512, nHeight := 512

   pSvg := svg_Init( "logo-xDev.svg", nWidth, nHeight )

   svg_Comment( pSvg, "0x070f17 0x264d73 0x73264d 0x4d7326 0x262773 0x267373 0x734c26 0xe9edf1" )

   svg_FilledCircle( pSvg, nWidth / 2, nHeight / 2, 255, "#73264d" )

   svg_Line( pSvg, 42, ( nHeight - 250 ) / 2, nWidth - 42, ( nHeight - 250 ) / 2, 30, "#323232" )

   svg_FilledRect( pSvg, 25, ( nHeight - 220 ) / 2, nWidth - 50, 180, "#F2F2F2" )

   svg_Line( pSvg, 25, ( nHeight + 141 ) / 2, nWidth - 25, ( nHeight + 141 ) / 2, 30, "#323232" )

   svg_Circle( pSvg, nWidth / 2, nHeight / 2, 256 - 15, 30, "#323232" )

   svg_Text( pSvg, ( nWidth - 4 * ( 110 * 0.8 ) ) / 2 + 25, ( nHeight + 40 ) / 2, ;
             "xDev", "Times New Roman", 140, FONT_WEIGHT_BOLD, "#0C0C0C" )

   svg_Close( pSvg )

RETURN`;

function href(prefix, url) {
  return esc(prefix + url);
}

function prose(text) {
  return text
    .split(/\n\s*\n/)
    .filter(Boolean)
    .map((paragraph) => {
      const lines = paragraph.split('\n');
      const isList = lines.every((line) => /^\s*[-*]\s/.test(line));

      if (isList) {
        const items = lines
          .map((line) => `<li>${inlineMarkdown(line.replace(/^\s*[-*]\s/, ''))}</li>`)
          .join('');

        return `<ul>${items}</ul>`;
      }

      return `<p>${inlineMarkdown(lines.join(' '))}</p>`;
    })
    .join('');
}

function parseArgumentLine(line) {
  const bareName = line.match(/^([A-Za-z_]\w*)[\t ]*$/);
  if (bareName) {
    return { name: bareName[1], description: '' };
  }

  const quoted = line.match(/^\s*`([^`]+)`\s*(.*)$/);
  if (quoted) {
    return { name: quoted[1], description: quoted[2] };
  }

  return null;
}

function renderArguments(text) {
  const lines = text.split(/\r?\n/);

  if (!lines.some((line) => parseArgumentLine(line))) {
    return prose(text);
  }

  const argumentsList = [];
  const introduction = [];

  for (const line of lines) {
    const argument = parseArgumentLine(line);

    if (argument) {
      argumentsList.push({ name: argument.name, description: [argument.description] });
    } else if (argumentsList.length > 0) {
      argumentsList.at(-1).description.push(line);
    } else {
      introduction.push(line);
    }
  }

  const items = argumentsList
    .map((argument) => {
      const description = argument.description.join('\n').trim();
      const descriptionHtml = description
        ? `<div class="argument-description">${prose(description)}</div>`
        : '';

      return (
        '<div class="argument-item">' +
        `<p class="argument-name"><code>${esc(argument.name)}</code></p>` +
        descriptionHtml +
        '</div>'
      );
    })
    .join('');

  return `<div class="argument-list">${prose(introduction.join('\n'))}${items}</div>`;
}

function codeBlock(code, title, id, copy = true) {
  const action = copy
    ? `<button type="button" class="copy-button" data-copy="${esc(id)}" aria-label="Copy code" title="Copy code">${icons.copy}</button>`
    : '<span class="code-language">xDev</span>';

  return (
    '<div class="code-block">' +
    `<div class="code-toolbar"><span>${esc(title)}</span>${action}</div>` +
    `<pre tabindex="0"><code id="${esc(id)}">${highlightCode(code)}</code></pre>` +
    '</div>'
  );
}

function sidebarCategoryLink(category, page, prefix) {
  const isActive = page.category === category.id;
  const activeClass = isActive ? ' active' : '';
  const ariaCurrent = isActive ? ' aria-current="page"' : '';

  return (
    `<a class="sidebar-link${activeClass}" href="${href(prefix, category.url)}"${ariaCurrent}>` +
    `${category.name}</a>`
  );
}

function renderSidebarGroup(group, catalog, page, prefix) {
  const isUserLibraries = group === 'User libraries';
  const groupClass = isUserLibraries ? 'nav-group user-libraries' : 'nav-group';
  const categories = catalog.categories.filter((category) => category.group === group);

  return (
    `<div class="${groupClass}"><h2>${group}</h2>` +
    categories.map((category) => sidebarCategoryLink(category, page, prefix)).join('') +
    '</div>'
  );
}

function renderSidebarCollection(collection, page, prefix) {
  const isActive = page.collection?.id === collection.id;
  const activeClass = isActive ? ' active' : '';
  const ariaCurrent = isActive ? ' aria-current="page"' : '';

  return (
    '<div class="sidebar-collection">' +
    `<a class="sidebar-link${activeClass}" href="${href(prefix, collection.url)}"${ariaCurrent}>` +
    `${collection.name}</a>` +
    '</div>'
  );
}

function sidebar(catalog, page, prefix) {
  const groupLinks = SIDEBAR_GROUPS
    .map((group) => renderSidebarGroup(group, catalog, page, prefix))
    .join('');

  const collectionLinks = catalog.collections
    .map((collection) => renderSidebarCollection(collection, page, prefix))
    .join('');

  return (
    '<aside class="sidebar" id="site-navigation">' +
    '<div class="sidebar-top"><button class="close-menu" type="button" aria-label="Close navigation">×</button></div>' +
    `<a class="sidebar-link${page.type === 'home' ? ' active' : ''}" href="${href(prefix, 'index.html')}">Overview</a>` +
    `<a class="sidebar-link${page.type === 'index' ? ' active' : ''}" href="${href(prefix, 'reference/index.html')}">All Functions</a>` +
    groupLinks +
    collectionLinks +
    '</aside>'
  );
}

function categoryCards(catalog, prefix, group) {
  const cards = catalog.categories
    .filter((category) => !group || category.group === group)
    .map((category) => {
      return (
        `<a class="category-card" href="${href(prefix, category.url)}">` +
        `<h3>${category.name}</h3><p>${category.description}</p></a>`
      );
    })
    .join('');

  return `<div class="category-grid">${cards}</div>`;
}

function home(catalog, prefix) {
  const body = `
    <section class="hero"><div class="hero-copy"><h1>xDev Documentation</h1><div class="hero-actions"><a class="button primary" href="${href(prefix, 'reference/index.html')}">Browse all functions </a></div></div><img class="hero-logo" src="${href(prefix, 'assets/images/logo-xdev.svg')}" alt="xDev" width="512" height="512"></section>
    <section class="content-section language-section" id="language"><h2>Language</h2>${categoryCards(catalog, prefix, 'Language')}</section>
    <section class="content-section example-section" id="examples">${codeBlock(LOGO_EXAMPLE, 'logo-xDev.prg', 'home-example', false)}</section>`;

  return { body };
}

function groupDocumentsByLetter(documents) {
  return Map.groupBy(documents, (doc) =>
    /^[a-z]/i.test(doc.name) ? doc.name[0].toUpperCase() : '#',
  );
}

function renderEntryRow(doc, catalog, prefix) {
  const categoryName = catalog.categories.find((category) => category.id === doc.category).name;
  const summary = doc.summary || 'Open this reference entry.';

  return (
    `<a class="entry-row" href="${href(prefix, doc.url)}">` +
    `<div><h3>${esc(doc.name)}</h3><p>${esc(summary)}</p></div>` +
    `<span class="entry-category">${esc(categoryName)}</span>` +
    '</a>'
  );
}

function renderLetterGroup(letter, docs, catalog, prefix) {
  const rows = docs.map((doc) => renderEntryRow(doc, catalog, prefix)).join('');

  return (
    `<section id="letter-${letter}" class="letter-group">` +
    `<h2>${letter}</h2><div>${rows}</div></section>`
  );
}

function entryList(documents, catalog, prefix) {
  if (!documents.length) {
    return (
      '<div class="empty-state"><h2>No entries yet.</h2>' +
      '<p>No documentation entries have been added to this category yet.</p></div>'
    );
  }

  const groups = groupDocumentsByLetter(documents);

  const alphabet = [...groups.keys()]
    .map((letter) => `<a href="#letter-${letter}">${letter}</a>`)
    .join('');

  const letterGroups = [...groups]
    .map(([letter, docs]) => renderLetterGroup(letter, docs, catalog, prefix))
    .join('');

  return (
    `<nav class="alphabet" aria-label="Jump to letter">${alphabet}</nav>` +
    `<div class="entry-list">${letterGroups}</div>`
  );
}

function functionCategories(catalog) {
  return catalog.categories.filter((category) => category.group !== 'Language');
}

function categoryChips(categories, prefix) {
  return categories
    .filter((category) => category.count)
    .map((category) => `<a href="${href(prefix, category.url)}">${category.name}</a>`)
    .join('');
}

function indexPage(catalog, page, prefix) {
  const category = catalog.categories.find((item) => item.id === page.category);
  const functions = functionCategories(catalog);

  const documents = catalog.documents.filter((doc) =>
    category
      ? doc.category === category.id
      : functions.some((item) => item.id === doc.category),
  );

  const chips = category
    ? ''
    : `<div class="category-chips">${categoryChips(functions, prefix)}</div>`;

  return {
    body: `
    <header class="page-heading"><h1>${category?.name || 'All Functions'}</h1></header>
    ${chips}${entryList(documents, catalog, prefix)}`,
  };
}

function normalizeName(name) {
  return name.replace(/\(.*?\)/g, '').replace(/\s+/g, '').toLowerCase();
}

function collectionPage(page, prefix) {
  const { collection } = page;

  const fileRows = collection.files
    .map((file) => {
      const summary = file.summary ? `<p>${esc(file.summary)}</p>` : '';
      return (
        `<a class="entry-row" href="${href(prefix, file.viewUrl)}">` +
        `<div><h3>${esc(file.name)}</h3>${summary}</div></a>`
      );
    })
    .join('');

  const body = collection.files.length
    ? `<div class="source-collection">${fileRows}</div>`
    : '<div class="empty-state"><p>No files have been copied yet.</p></div>';

  return {
    body: `<header class="page-heading"><h1>${collection.name}</h1></header>${body}`,
  };
}

function linkifySeeAlso(value, catalog, prefix, categoryId) {
  return value
    .split(/[,\n]/)
    .map((name) => name.trim())
    .filter(Boolean)
    .map((name) => {
      const matches = catalog.documents.filter(
        (item) => normalizeName(item.name) === normalizeName(name),
      );
      const target =
        matches.find((item) => item.category === categoryId) || matches[0];

      return target
        ? `<a href="${href(prefix, target.url)}">${esc(name)} </a>`
        : `<span class="unlinked-reference">${esc(name)}</span>`;
    })
    .join('');
}

function renderSectionContent(key, value, catalog, entry, prefix) {
  if (key === 'ARGUMENTS') {
    return renderArguments(value);
  }

  if (key === 'SYNTAX' || key === 'EXAMPLES') {
    const title = key === 'SYNTAX' ? 'Signature' : entry.sourceFile || entry.name;
    return codeBlock(value, title, `code-${key.toLowerCase()}`);
  }

  if (key === 'OUTPUT') {
    return (
      '<div class="code-block output-block">' +
      `<pre tabindex="0"><code id="code-output">${esc(value)}</code></pre></div>`
    );
  }

  if (key === 'IMAGE') {
    return entry.images.map((image) =>
      `<figure class="doc-image"><img src="${href(prefix, image.url)}" alt="${esc(image.name)}" loading="lazy" decoding="async"></figure>`,
    ).join('');
  }

  if (key === 'SEEALSO') {
    return `<div class="related-links">${linkifySeeAlso(value, catalog, prefix, entry.category)}</div>`;
  }

  return prose(value);
}

function documentSections(catalog, entry, prefix) {
  const sections = { ...entry.sections, EXAMPLES: entry.example };
  const available = Object.keys(sectionNames).filter(
    (key) => sections[key] || (key === 'OUTPUT' && Object.hasOwn(sections, key)),
  );

  return available
    .map((key) => {
      const content = renderSectionContent(key, sections[key], catalog, entry, prefix);

      return (
        `<section class="doc-section" id="${key.toLowerCase()}">` +
        `<h2>${sectionNames[key]}</h2>${content}</section>`
      );
    })
    .join('');
}

function entryNavigation(peers, position, prefix, urlKey = 'url') {
  const previous = peers[position - 1];
  const next = peers[position + 1];

  const previousHtml = previous
    ? `<a class="entry-nav-button" href="${href(prefix, previous[urlKey])}" title="${esc(previous.title || previous.name)}" rel="prev">Previous Entry</a>`
    : '<button type="button" class="entry-nav-button" disabled>Previous Entry</button>';

  const nextHtml = next
    ? `<a class="entry-nav-button" href="${href(prefix, next[urlKey])}" title="${esc(next.title || next.name)}" rel="next">Next Entry</a>`
    : '<button type="button" class="entry-nav-button" disabled>Next Entry</button>';

  return (
    `<nav class="entry-navigation" aria-label="Entry navigation">` +
    previousHtml +
    nextHtml +
    '</nav>'
  );
}

function renderSourceBody(catalog, file, prefix) {
  if (file.kind === 'text') {
    return (
      '<div class="code-block output-block">' +
      `<pre tabindex="0"><code>${esc(file.source)}</code></pre></div>`
    );
  }

  return documentSections(catalog, file, prefix);
}

function sourcePage(catalog, page, prefix) {
  const { collection, file } = page;

  const navigation = entryNavigation(
    collection.files,
    collection.files.indexOf(file),
    prefix,
    'viewUrl',
  );

  const body = renderSourceBody(catalog, file, prefix);
  const summary = file.summary ? `<p>${esc(file.summary)}</p>` : '';

  return {
    body:
      '<header class="page-heading doc-heading">' +
      '<div class="doc-heading-copy">' +
      `<span class="eyebrow">${esc(collection.name)}</span>` +
      `<h1>${esc(file.title)}</h1>${summary}` +
      `</div>${navigation}</header>${body}`,
  };
}

function documentPage(catalog, page, prefix) {
  const doc = page.document;
  const category = catalog.categories.find((item) => item.id === doc.category);

  const body = documentSections(catalog, doc, prefix);

  const peers = catalog.documents.filter((item) => item.category === doc.category);
  const position = peers.indexOf(doc);
  const navigation = entryNavigation(peers, position, prefix);

  const summary = doc.summary ? `<p>${esc(doc.summary)}</p>` : '';

  return {
    body: `
    <header class="page-heading doc-heading"><div class="doc-heading-copy"><span class="eyebrow">${category.name.toUpperCase()}</span><h1>${esc(doc.name)}</h1>${summary}</div>${navigation}</header>
    ${body}`,
  };
}

function resolveContent(page, catalog, prefix) {
  switch (page.type) {
    case 'home':
      return home(catalog, prefix);
    case 'document':
      return documentPage(catalog, page, prefix);
    case 'source':
      return sourcePage(catalog, page, prefix);
    case 'collection':
      return collectionPage(page, prefix);
    default:
      return indexPage(catalog, page, prefix);
  }
}

function computePageTitle(page, catalog) {
  const category = catalog.categories.find((item) => item.id === page.category);

  return (
    page.document?.name ||
    page.file?.title ||
    page.collection?.name ||
    category?.name ||
    (page.type === 'index' ? 'All Functions' : 'Documentation')
  );
}

function renderHead(title, page, prefix, options) {
  const description =
    page.document?.summary ||
    'The xDev language reference: functions, syntax and downloadable PRG examples.';

  const liveMeta = options.live
    ? `<meta name="doc-version" content="${esc(options.version)}"><script src="${href(prefix, 'assets/js/live.js')}" defer></script>`
    : '';

  return (
    '<head>' +
    '<meta charset="utf-8">' +
    '<meta name="viewport" content="width=device-width, initial-scale=1">' +
    `<meta name="description" content="${esc(description)}">` +
    '<meta name="color-scheme" content="light dark">' +
    `<title>${esc(title)} · xDev Documentation</title>` +
    `<link rel="icon" href="${href(prefix, 'assets/images/logo-xdev.svg')}" type="image/svg+xml">` +
    `<link rel="stylesheet" href="${href(prefix, 'assets/css/site.css')}">` +
    `<script src="${href(prefix, 'assets/js/site.js')}" defer></script>` +
    liveMeta +
    '</head>'
  );
}

function renderHeaderBar(page, prefix) {
  const docsClass = page.type === 'home' ? 'selected' : '';
  const referenceClass = page.type !== 'home' ? 'selected' : '';

  return (
    '<header class="site-header">' +
    '<div class="brand-area"><button type="button" class="menu-button" aria-label="Open navigation" aria-controls="site-navigation" aria-expanded="false">☰</button></div>' +
    '<nav class="header-nav" aria-label="Main">' +
    `<a class="${docsClass}" href="${href(prefix, 'index.html')}">Documentation</a>` +
    `<a class="${referenceClass}" href="${href(prefix, 'reference/index.html')}">Reference</a>` +
    '</nav>' +
    '<div class="header-actions">' +
    `<button type="button" class="search-trigger" aria-haspopup="dialog">${icons.search}<span>Search documentation</span><kbd>Ctrl+K</kbd></button>` +
    '<button type="button" class="theme-toggle" aria-label="Switch color theme" title="Switch color theme">◐</button>' +
    `<a class="github-link" href="https://github.com/xDev-Language" aria-label="xDev on GitHub">${icons.github}</a>` +
    '</div>' +
    '</header>'
  );
}

function renderFooter() {
  return (
    '<footer class="site-footer">' +
    '<span>Copyright © 2024-2026 xDev Developments</span>' +
    '<span>Created by the xDev community.</span>' +
    '</footer>'
  );
}

function renderSearchDialog(catalog) {
  const categoryOptions = catalog.categories
    .filter((category) => category.count)
    .map((category) => `<option value="${category.id}">${category.name}</option>`)
    .join('');

  return (
    '<dialog class="search-dialog" aria-labelledby="search-title">' +
    `<div class="search-input-row">${icons.search}` +
    '<label class="sr-only" id="search-title" for="doc-search">Search documentation</label>' +
    '<input id="doc-search" type="search" placeholder="Search functions, classes, and more…" autocomplete="off" spellcheck="false">' +
    '<button type="button" class="close-search" aria-label="Close search">Esc</button>' +
    '</div>' +
    '<div class="search-filters"><label for="search-category">Category</label>' +
    `<select id="search-category"><option value="">All categories</option>${categoryOptions}</select></div>` +
    '<p class="search-status" role="status" aria-live="polite"></p>' +
    '<div class="search-results" id="search-results"></div>' +
    '</dialog>'
  );
}

function renderPage(catalog, page = { type: 'home' }, options = {}) {
  const prefix = options.prefix ?? '';
  const title = computePageTitle(page, catalog);
  const content = resolveContent(page, catalog, prefix);

  const head = renderHead(title, page, prefix, options);
  const headerBar = renderHeaderBar(page, prefix);
  const sidebarHtml = sidebar(catalog, page, prefix);
  const searchDialog = renderSearchDialog(catalog);

  const mainClass = page.type === 'home' ? 'main-content overview' : 'main-content';

  return `<!doctype html>
<html lang="en">${head}
<body data-base="${esc(prefix)}"><a class="skip-link" href="#main-content">Skip to content</a>
${headerBar}
<div class="site-layout">${sidebarHtml}<main id="main-content" class="${mainClass}">${content.body}${renderFooter()}</main></div><div class="menu-backdrop" hidden></div>
${searchDialog}<div class="toast" role="status" aria-live="polite"></div>
</body></html>`;
}

module.exports = { renderPage };
