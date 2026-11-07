'use strict';

const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { ROOT, loadCatalog } = require('../tools/xdev-doc-catalog');
const { renderPage, renderArguments } = require('../tools/xdev-doc-site');
const { buildSite } = require('../tools/xdev-doc-build');
const { createDocServer } = require('../tools/xdev-doc-server');

test('all source documents are discovered, parsed and given unique routes', () => {
  const catalog = loadCatalog();
  assert.equal(catalog.diagnostics.length, 0);
  const sourceCount = catalog.categories.reduce((count, category) => {
    const directory = path.join(ROOT, 'content', category.folder);
    return count + (fs.existsSync(directory) ? fs.readdirSync(directory).filter(file => file.endsWith('.prg')).length : 0);
  }, 0);
  assert.equal(catalog.documents.length, sourceCount);
  assert.equal(new Set(catalog.documents.map(doc => doc.url)).size, catalog.documents.length);
  const abs = catalog.documents.find(doc => doc.name === 'Abs()');
  assert.equal(abs.category, 'core');
  assert.match(abs.example, /PROCEDURE Main/);
  assert.match(abs.example, /LOCAL nYesterday/);
});

test('All Functions lists functions while commands stay in their own category', () => {
  const catalog = loadCatalog();
  const html = renderPage(catalog, { type: 'index' }, { prefix: '../' });
  assert.match(html, /<h1>All Functions<\/h1>/);
  assert.ok(html.includes('../reference/core/aadd.html'));
  assert.ok(!html.includes('../reference/commands/accept.html'));
  assert.ok(!html.includes('COMPLETE REFERENCE'));
  const commands = renderPage(catalog, { type: 'category', category: 'commands' }, { prefix: '../../' });
  assert.ok(commands.includes('../../reference/commands/accept.html'));
});

test('named arguments keep separate rows and their following descriptions', () => {
  const html = renderArguments('`aTarget`\nAn array that receives the value.\nThis line continues its description.\n`expValue`\nA value such as <sample>.');
  assert.equal((html.match(/class="argument-item"/g) || []).length, 2);
  assert.match(html, /<code>aTarget<\/code>/);
  assert.match(html, /<code>expValue<\/code>/);
  assert.match(html, /An array that receives the value. This line continues its description./);
  assert.match(html, /&lt;sample&gt;/);
  assert.equal(renderArguments('cName is a file name.\nIt can include a path.'), '<p>cName is a file name. It can include a path.</p>');
});

test('plain argument names need no backticks and indented descriptions stay with their argument', () => {
  const html = renderArguments('aTarget\n   Target array.\n   Mutable\n\nexpValue\n   Value to append.');
  assert.equal((html.match(/class="argument-item"/g) || []).length, 2);
  assert.match(html, /<code>aTarget<\/code>/);
  assert.match(html, /<code>expValue<\/code>/);
  const first = html.slice(0, html.indexOf('<code>expValue</code>'));
  assert.ok(first.includes('Target array.') && first.includes('Mutable'));
  assert.ok(!first.includes('Value to append.'));
  const bare = renderArguments('aTarget\nexpValue');
  assert.equal((bare.match(/class="argument-item"/g) || []).length, 2);
  assert.ok(!bare.includes('argument-description'));
});

test('document pages include source examples, returns, notes and linked related entries', () => {
  const catalog = loadCatalog();
  const doc = catalog.documents.find(item => item.name === 'FileTextUse()');
  const html = renderPage(catalog, { type: 'document', category: doc.category, document: doc }, { prefix: '../../' });
  for (const name of ['syntax', 'arguments', 'returns', 'description', 'notes', 'examples', 'seealso']) assert.ok(html.includes(`id="${name}"`), name);
  assert.ok(html.includes('../../reference/core/filetextselect.html'));
  assert.ok(!html.includes('Download source'));
  assert.ok(!html.includes('page-pagination'));
  assert.ok(html.includes('aria-label="Copy code"'));
  assert.ok(!html.includes('$DOCEND$'));
  assert.ok(!html.includes('live.js'));
  assert.ok(html.includes('rel="icon" href="../../assets/images/logo-xdev.svg"'));
});

test('entry navigation stays in the heading and disables links at category boundaries', () => {
  const catalog = loadCatalog();
  const entries = catalog.documents.filter(doc => doc.category === 'core');
  for (const index of [0, 1, entries.length - 1]) {
    const html = renderPage(catalog, { type: 'document', category: 'core', document: entries[index] }, { prefix: '../../' });
    const header = html.match(/<header class="page-heading doc-heading">([\s\S]*?)<\/header>/)[1];
    assert.ok(header.includes('aria-label="Entry navigation"'));
    assert.equal(header.includes('disabled>Previous Entry'), index === 0);
    assert.equal(header.includes('disabled>Next Entry'), index === entries.length - 1);
    if (index > 0) assert.ok(header.includes(`href="../../${entries[index - 1].url}"`));
    if (index < entries.length - 1) assert.ok(header.includes(`href="../../${entries[index + 1].url}"`));
  }
});

test('Output appears after Example and stays visible while its marker is empty', () => {
  const catalog = loadCatalog();
  const document = catalog.documents.find(doc => doc.name === 'AAdd()');
  document.sections.OUTPUT = 'RETURN <value> & "text"\n  next    2';
  const page = { type: 'document', category: document.category, document };
  const html = renderPage(catalog, page, { prefix: '../../' });
  assert.ok(html.indexOf('id="output"') > html.indexOf('id="examples"'));
  assert.ok(html.includes('<code id="code-output">RETURN &lt;value&gt; &amp; &quot;text&quot;\n  next    2</code>'));
  document.sections.OUTPUT = '';
  const empty = renderPage(catalog, page, { prefix: '../../' });
  assert.ok(empty.includes('id="output"'));
  assert.ok(empty.includes('<code id="code-output"></code>'));
  delete document.sections.OUTPUT;
  assert.ok(!renderPage(catalog, page, { prefix: '../../' }).includes('id="output"'));
});

test('static export has working internal links and includes no executable or server tools', () => {
  const temporary = fs.mkdtempSync(path.join(os.tmpdir(), 'xdev-site-test-'));
  try {
    fs.cpSync(path.join(ROOT, 'content'), path.join(temporary, 'content'), { recursive: true });
    fs.cpSync(path.join(ROOT, 'assets'), path.join(temporary, 'assets'), { recursive: true });
    fs.mkdirSync(path.join(temporary, 'examples', 'nested folder'), { recursive: true });
    fs.mkdirSync(path.join(temporary, 'tests'), { recursive: true });
    const sample = 'PROCEDURE Main()\n   QOut( "sample" )\nRETURN\n';
    const demo = 'Zażółć gęślą jaźń — ∮ α 世界\n';
    fs.writeFileSync(path.join(temporary, 'examples', 'nested folder', 'sample.prg'), sample);
    fs.writeFileSync(path.join(temporary, 'examples', 'UTF-8-demo.txt'), demo);
    fs.writeFileSync(path.join(temporary, 'examples', 'other.txt'), 'not public');
    fs.writeFileSync(path.join(temporary, 'tests', 'sample.prg'), sample);
    fs.writeFileSync(path.join(temporary, 'tests', 'private.test.js'), 'not public');
    fs.writeFileSync(path.join(temporary, 'tests', 'sample.out'), 'not public');
    const result = buildSite({ root: temporary });
    let pages = 0;
    function walk(directory) {
      for (const item of fs.readdirSync(directory, { withFileTypes: true })) {
        const file = path.join(directory, item.name);
        if (item.isDirectory()) { walk(file); continue; }
        assert.ok(!file.endsWith('.exe'));
        if (!file.endsWith('.html')) continue;
        pages++;
        const html = fs.readFileSync(file, 'utf8');
        for (const match of html.matchAll(/(?:href|src)="([^"]+)"/g)) {
          const link = match[1];
          if (/^(?:https?:|#)/.test(link)) continue;
          const target = path.resolve(path.dirname(file), decodeURIComponent(link.split('#')[0]));
          assert.ok(target.startsWith(result.output + path.sep), `${file}: ${link} leaves output`);
          assert.ok(fs.existsSync(target), `${file}: broken link ${link}`);
        }
      }
    }
    walk(result.output);
    assert.equal(pages, result.pages);
    assert.ok(fs.existsSync(path.join(result.output, '.nojekyll')));
    assert.equal(fs.readFileSync(path.join(result.output, 'assets/images/logo-xdev.svg'), 'utf8'),
      fs.readFileSync(path.join(ROOT, 'assets/images/logo-xdev.svg'), 'utf8'));
    assert.equal(fs.existsSync(path.join(result.output, 'doc')), false);
    assert.equal(fs.existsSync(path.join(result.output, 'tools')), false);
    assert.equal(fs.readFileSync(path.join(result.output, 'examples', 'nested folder', 'sample.prg'), 'utf8'), sample);
    assert.equal(fs.readFileSync(path.join(result.output, 'tests', 'sample.prg'), 'utf8'), sample);
    assert.equal(fs.readFileSync(path.join(result.output, 'examples', 'UTF-8-demo.txt'), 'utf8'), demo);
    assert.equal(fs.existsSync(path.join(result.output, 'examples', 'other.txt')), false);
    assert.equal(fs.existsSync(path.join(result.output, 'tests', 'private.test.js')), false);
    assert.equal(fs.existsSync(path.join(result.output, 'tests', 'sample.out')), false);
    const data = JSON.parse(fs.readFileSync(path.join(result.output, 'assets/data/catalog.json'), 'utf8'));
    assert.equal(data.documents.length, result.entries);
    assert.throws(() => buildSite({ root: temporary, output: path.join(temporary, 'content') }), /regular .site/);
  } finally { fs.rmSync(temporary, { recursive: true, force: true }); }
});

test('source collections preserve folders and UTF-8 while exposing only selected files', async () => {
  const temporary = fs.mkdtempSync(path.join(os.tmpdir(), 'xdev-collections-test-'));
  fs.mkdirSync(path.join(temporary, 'examples', 'nested folder'), { recursive: true });
  fs.mkdirSync(path.join(temporary, 'examples', 'rosetta-code'), { recursive: true });
  fs.mkdirSync(path.join(temporary, 'tests'), { recursive: true });
  const sample = 'PROCEDURE Main()\nRETURN\n';
  const demo = 'Zażółć gęślą jaźń — ∮ α 世界\n';
  fs.writeFileSync(path.join(temporary, 'examples', 'nested folder', 'a sample.prg'), sample);
  fs.writeFileSync(path.join(temporary, 'examples', 'UTF-8-demo.txt'), demo);
  fs.writeFileSync(path.join(temporary, 'examples', 'other.txt'), 'not public');
  fs.writeFileSync(path.join(temporary, 'tests', 'sample.prg'), sample);
  fs.writeFileSync(path.join(temporary, 'tests', 'private.test.js'), 'not public');
  const documented = name => `/*\n * $DOC$\n * $NAME$\n * ${name}\n * $DESCRIPTION$\n * A documented sample.\n * $EXAMPLES$\n * examples/rosetta-code/sample.prg\n * $OUTPUT$\n *   <value> & result\n * $DOCEND$\n */\n${sample}`;
  fs.writeFileSync(path.join(temporary, 'examples', 'rosetta-code', 'sample.prg'), documented('Rosetta sample'));
  fs.writeFileSync(path.join(temporary, 'tests', 'documented.prg'), documented('Test sample').replace('examples/rosetta-code/sample.prg', 'tests/documented.prg'));
  const server = createDocServer({ root: temporary });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const base = `http://127.0.0.1:${server.address().port}`;
  try {
    const index = await fetch(base + '/examples/index.html');
    assert.equal(index.status, 200);
    const html = await index.text();
    assert.ok(html.includes('nested folder/a sample.prg'));
    assert.ok(html.includes('../examples/nested%20folder/a%20sample.html'));
    assert.ok(!html.includes('<h3>rosetta-code/sample.prg</h3>'));
    assert.ok(html.includes('UTF-8-demo.txt'));
    const demoResponse = await fetch(base + '/examples/UTF-8-demo.txt');
    assert.equal(demoResponse.headers.get('content-type'), 'text/plain; charset=utf-8');
    assert.equal(await demoResponse.text(), demo);
    assert.equal((await fetch(base + '/examples/other.txt')).status, 404);
    assert.equal(await fetch(base + '/examples/nested%20folder/a%20sample.prg').then(response => response.text()), sample);
    const plainPage = await fetch(base + '/examples/nested%20folder/a%20sample.html');
    assert.equal(plainPage.status, 200);
    assert.match(plainPage.headers.get('content-type'), /text\/html/);
    assert.ok((await plainPage.text()).includes('class="token-keyword">PROCEDURE'));
    const rosettaIndex = await fetch(base + '/examples/rosetta-code/index.html').then(response => response.text());
    assert.ok(rosettaIndex.includes('<h1>Rosetta Code</h1>'));
    assert.ok(rosettaIndex.includes('../../examples/rosetta-code/sample.html'));
    const rosettaPage = await fetch(base + '/examples/rosetta-code/sample.html').then(response => response.text());
    assert.ok(rosettaPage.includes('<h1>Rosetta sample</h1>'));
    assert.ok(rosettaPage.includes('A documented sample.'));
    assert.ok(rosettaPage.includes('class="token-keyword">PROCEDURE'));
    assert.ok(rosettaPage.includes('<code id="code-output">  &lt;value&gt; &amp; result</code>'));
    assert.ok(rosettaPage.includes('aria-label="Copy code"'));
    const testPage = await fetch(base + '/tests/documented.html').then(response => response.text());
    assert.ok(testPage.includes('<h1>Test sample</h1>'));
    assert.ok(testPage.includes('class="token-keyword">PROCEDURE'));
    const textPage = await fetch(base + '/examples/UTF-8-demo.html').then(response => response.text());
    assert.ok(textPage.includes(demo));
    assert.equal((await fetch(base + '/tests/index.html')).status, 200);
    assert.equal(await fetch(base + '/tests/sample.prg').then(response => response.text()), sample);
    assert.equal((await fetch(base + '/tests/private.test.js')).status, 404);
  } finally {
    await new Promise(resolve => server.close(resolve));
    fs.rmSync(temporary, { recursive: true, force: true });
  }
});

test('HTTP preview supports pages, HEAD, conditional requests, source download and errors', async () => {
  const server = createDocServer();
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const base = `http://127.0.0.1:${server.address().port}`;
  try {
    const response = await fetch(base + '/');
    assert.equal(response.status, 200);
    const html = await response.text();
    assert.match(html, /<h1>xDev Documentation<\/h1>/);
    const head = await fetch(base + '/', { method: 'HEAD' });
    assert.equal(head.headers.get('etag'), response.headers.get('etag'));
    assert.equal(await head.text(), '');
    const cached = await fetch(base + '/', { headers: { 'If-None-Match': response.headers.get('etag') } });
    assert.equal(cached.status, 304);
    const version = await fetch(base + '/__version').then(value => value.text());
    assert.ok(html.includes(`content="${version}"`));
    assert.equal(await fetch(base + '/__version').then(value => value.text()), version);
    const source = await fetch(base + '/content/Function%20core/Abs.prg');
    assert.equal(source.status, 200);
    assert.match(source.headers.get('content-disposition'), /attachment/);
    assert.match(await source.text(), /\$DOC\$/);
    const logo = await fetch(base + '/assets/images/logo-xdev.svg');
    assert.equal(logo.status, 200);
    assert.equal(logo.headers.get('content-type'), 'image/svg+xml');
    assert.equal(await logo.text(), fs.readFileSync(path.join(ROOT, 'assets/images/logo-xdev.svg'), 'utf8'));
    assert.equal((await fetch(base + '/doc/Function%20core/Abs.prg')).status, 404);
    assert.equal((await fetch(base + '/reference/core/abs.html')).status, 200);
    assert.equal((await fetch(base + '/assets/data/catalog.json')).status, 200);
    assert.equal((await fetch(base + '/missing')).status, 404);
    assert.equal((await fetch(base + '/package.json')).status, 404);
    assert.equal((await fetch(base + '/content/missing.prg')).status, 404);
    assert.equal((await fetch(base + '/assets/%5c..%5cpackage.json')).status, 400);
    assert.equal((await fetch(base + '/%E0%A4%A')).status, 400);
    assert.equal((await fetch(base + '/', { method: 'POST' })).status, 405);
  } finally { await new Promise(resolve => server.close(resolve)); }
});

test('preview discovers additions, updates and removals without restarting', async () => {
  const temporary = fs.mkdtempSync(path.join(os.tmpdir(), 'xdev-live-test-'));
  const directory = path.join(temporary, 'content', 'Function core');
  fs.mkdirSync(directory, { recursive: true });
  const file = path.join(directory, 'Demo.prg');
  const source = '/* $DOC$\n$NAME$\nDemo()\n$ONELINER$\nFirst version\n$DOCEND$ */\nPROCEDURE Main()\nRETURN';
  fs.writeFileSync(file, source);
  const server = createDocServer({ root: temporary });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const base = `http://127.0.0.1:${server.address().port}`;
  try {
    const original = await fetch(base + '/__version').then(response => response.text());
    assert.match(await fetch(base + '/reference/core/demo.html').then(response => response.text()), /First version/);
    fs.writeFileSync(file, source.replace('First version', 'Updated description'));
    await new Promise(resolve => setTimeout(resolve, 550));
    assert.notEqual(await fetch(base + '/__version').then(response => response.text()), original);
    assert.match(await fetch(base + '/reference/core/demo.html').then(response => response.text()), /Updated description/);
    fs.writeFileSync(path.join(directory, 'Other.prg'), source.replace('Demo()', 'Other()'));
    await new Promise(resolve => setTimeout(resolve, 550));
    assert.equal((await fetch(base + '/reference/core/other.html')).status, 200);
    fs.unlinkSync(file);
    await new Promise(resolve => setTimeout(resolve, 550));
    assert.equal((await fetch(base + '/reference/core/demo.html')).status, 404);
  } finally {
    await new Promise(resolve => server.close(resolve));
    fs.rmSync(temporary, { recursive: true, force: true });
  }
});
