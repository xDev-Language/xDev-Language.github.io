'use strict';

const test = require('node:test');
const assert = require('node:assert/strict');
const { parseSource, parseSections, extractDocBlocks, highlightCode, inlineMarkdown } = require('../tools/xdev-doc-parser');

test('all sections stay separate and comment decoration is removed', () => {
  const source = `/*
 * $DOC$
 * $TEMPLATE$
 * Function
 * $NAME$
 * Sample()
 * $ONELINER$
 * A short description.
 * $SYNTAX$
 * Sample( n ) --> nResult
 * $ARGUMENTS$
 * n is numeric.
 * $RETURNS$
 * A number.
 * $DESCRIPTION$
 * An inline $NAME$ is ordinary text.
 * $NOTES$
 * Some notes.
 * $EXAMPLES$
 *
 * $CATEGORY$
 * Function core
 * $HEADER$
 * sample.ch
 * $SEEALSO$
 * Abs()
 * $DOCEND$
 */
PROCEDURE Main()
   QOut( Sample( 1 ) )
RETURN`;
  const parsed = parseSource(source);
  assert.deepEqual(parsed.diagnostics, []);
  const { sections, example } = parsed.documents[0];
  assert.equal(Object.keys(sections).length, 12);
  assert.equal(sections.NAME, 'Sample()');
  assert.equal(sections.RETURNS, 'A number.');
  assert.equal(sections.DESCRIPTION, 'An inline $NAME$ is ordinary text.');
  assert.equal(sections.NOTES, 'Some notes.');
  assert.equal(sections.HEADER, 'sample.ch');
  assert.equal(sections.SEEALSO, 'Abs()');
  assert.equal(example, 'PROCEDURE Main()\n   QOut( Sample( 1 ) )\nRETURN');
});

test('both terminators, CRLF, undecorated comments and explicit examples work', () => {
  const source = '/*\r\n$DOC$\r\n$NAME$\r\nDemo()\r\n$EXAMPLES$\r\n   IF .T.\r\n      QOut( "example" )\r\n   ENDIF\r\n$END$\r\n*/\r\nQOut( "source" )';
  assert.equal(extractDocBlocks(source).length, 1);
  const doc = parseSource(source).documents[0];
  assert.equal(doc.sections.NAME, 'Demo()');
  assert.equal(doc.example, 'IF .T.\n   QOut( "example" )\nENDIF');
  assert.equal(doc.sourceExample, 'QOut( "source" )');
});

test('OUTPUT preserves line breaks and column spacing separately from following sections', () => {
  const source = '/*\n * $DOC$\n * $NAME$\n * Demo()\n * $OUTPUT$\n *   Name    Value\n *   alpha   1\n *     beta  2\n * $SEEALSO$\n * Other()\n * $DOCEND$\n */';
  const parsed = parseSource(source);
  assert.deepEqual(parsed.diagnostics, []);
  assert.equal(parsed.documents[0].sections.OUTPUT, '  Name    Value\n  alpha   1\n    beta  2');
  assert.equal(parsed.documents[0].sections.SEEALSO, 'Other()');
});

test('separate comments and multiple documented examples are not merged', () => {
  const source = '/* License */\n/* $DOC$\n$NAME$\nOne()\n$DOCEND$ */\nOne()\n/* $DOC$\n$NAME$\nTwo()\n$DOCEND$ */\nTwo()';
  const result = parseSource(source);
  assert.equal(result.documents.length, 2);
  assert.equal(result.documents[0].example, 'One()');
  assert.equal(result.documents[1].example, 'Two()');
  assert.equal(parseSections(extractDocBlocks(source)[0]).NAME, 'One()');
});

test('incomplete blocks and unknown sections produce diagnostics', () => {
  assert.match(parseSource('/* $DOC$\n$NAME$\nBroken()\n*/').diagnostics[0], /missing \$DOCEND\$/);
  assert.match(parseSource('/* $DOC$\n$NAME$\nBroken()\n$DOCEND$').diagnostics[0], /missing its closing/);
  const result = parseSource('/* $DOC$\n$NAME$\nDemo()\n$CUSTOM$\nkept\n$END$ */');
  assert.equal(result.documents[0].sections.CUSTOM, 'kept');
  assert.match(result.diagnostics[0], /Unknown documentation section: CUSTOM/);
  assert.equal(parseSource('PROCEDURE Main()\nRETURN').documents.length, 0);
});

test('markup and highlighting preserve code without allowing HTML injection', () => {
  const html = highlightCode('LOCAL c := "<script>alert(1)</script>" // note\nRETURN 5');
  assert.ok(!html.includes('<script>'));
  assert.match(html, /token-keyword/);
  assert.match(html, /token-string/);
  assert.match(html, /token-comment/);
  assert.match(html, /token-number/);
  assert.equal(inlineMarkdown('`a*b*` and **bold** <img>'), '<code>a*b*</code> and <strong>bold</strong> &lt;img&gt;');
});

test('xDev highlighting separates declarations, calls, variables, constants and arithmetic', () => {
  const source = 'PROCEDURE Main()\n   LOCAL pSvg := NIL\n   pSvg := svg_Circle( pSvg, 256 - 15, 30 * 2, FONT_WEIGHT_BOLD, "#73264d" )\n   IF .T.\n      RETURN\n   ENDIF\n#include "svg.ch"\n// note';
  const html = highlightCode(source);
  assert.match(html, /class="token-keyword">PROCEDURE<\/span>/);
  assert.match(html, /class="token-function">Main<\/span>/);
  assert.match(html, /class="token-function">svg_Circle<\/span>/);
  assert.match(html, /class="token-variable">pSvg<\/span>/);
  assert.match(html, /class="token-constant">FONT_WEIGHT_BOLD<\/span>/);
  assert.match(html, /class="token-operator">\*<\/span>/);
  assert.match(html, /class="token-literal">NIL<\/span>/);
  assert.match(html, /class="token-keyword token-control">IF<\/span>/);
  assert.match(html, /class="token-keyword token-directive">#include<\/span>/);
  const entities = { '&amp;': '&', '&lt;': '<', '&gt;': '>', '&quot;': '"', '&#39;': "'" };
  assert.equal(html.replace(/<\/?span\b[^>]*>/g, '').replace(/&(?:amp|lt|gt|quot|#39);/g, entity => entities[entity]), source);
});
