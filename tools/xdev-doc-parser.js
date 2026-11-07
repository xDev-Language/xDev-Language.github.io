'use strict';

const KNOWN_SECTIONS = ['TEMPLATE', 'NAME', 'CATEGORY', 'ONELINER', 'SYNTAX',
  'ARGUMENTS', 'RETURNS', 'DESCRIPTION', 'NOTES', 'EXAMPLES', 'OUTPUT', 'HEADER', 'SEEALSO'];

function escapeHtml(value) {
  return String(value ?? '').replace(/[&<>"']/g, character =>
    ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[character]);
}

function inlineMarkdown(value) {
  return String(value ?? '').split(/(`[^`]+`)/g).map(part => {
    if (part.startsWith('`') && part.endsWith('`')) return `<code>${escapeHtml(part.slice(1, -1))}</code>`;
    return escapeHtml(part).replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>')
      .replace(/\*([^*]+)\*/g, '<em>$1</em>');
  }).join('');
}

function docBlocks(source) {
  const blocks = [];
  for (const match of String(source).matchAll(/\/\*[\s\S]*?(?:\*\/|$)/g)) {
    if (/\$DOC\$/.test(match[0])) blocks.push({ text: match[0], start: match.index, end: match.index + match[0].length });
  }
  return blocks;
}

function extractDocBlocks(source) {
  return docBlocks(source).filter(block => /\$(?:DOCEND|END)\$/.test(block.text)).map(block => block.text);
}

function trimBlock(value, dedent = true) {
  const lines = value.replace(/\r\n?/g, '\n').split('\n');
  while (lines.length && !lines[0].trim()) lines.shift();
  while (lines.length && !lines.at(-1).trim()) lines.pop();
  const indentation = dedent ? Math.min(...lines.filter(line => line.trim()).map(line => line.match(/^\s*/)[0].length)) : 0;
  return lines.map(line => line.slice(Number.isFinite(indentation) ? indentation : 0)).join('\n');
}

function parseSections(docBlock) {
  const lines = String(docBlock).replace(/^\/\*/, '').replace(/\*\/$/, '')
    .replace(/\r\n?/g, '\n').split('\n').map(line => line.replace(/^[\t ]*\*(?: )?/, ''));
  const sections = {};
  let active = false;
  let section;
  for (const line of lines) {
    const marker = line.match(/^\s*\$([A-Z][A-Z0-9_]*)\$\s*$/);
    if (marker) {
      const name = marker[1];
      if (name === 'DOC') { active = true; continue; }
      if (name === 'DOCEND' || name === 'END') break;
      if (active) { section = name; sections[section] ??= []; }
    } else if (active && section) sections[section].push(line);
  }
  return Object.fromEntries(Object.entries(sections).map(([name, lines]) => [name, trimBlock(lines.join('\n'), name !== 'OUTPUT')]));
}

function parseSource(source) {
  const blocks = docBlocks(source);
  const diagnostics = [];
  const documents = [];
  blocks.forEach((block, index) => {
    if (!block.text.endsWith('*/')) {
      diagnostics.push('Documentation comment is missing its closing */.');
      return;
    }
    if (!/\$(?:DOCEND|END)\$/.test(block.text)) {
      diagnostics.push('Documentation block is missing $DOCEND$.');
      return;
    }
    const sections = parseSections(block.text);
    if (!sections.NAME) diagnostics.push('Documentation block is missing $NAME$.');
    for (const key of Object.keys(sections)) {
      if (!KNOWN_SECTIONS.includes(key)) diagnostics.push(`Unknown documentation section: ${key}.`);
    }
    const sourceExample = trimBlock(String(source).slice(block.end, blocks[index + 1]?.start ?? source.length));
    documents.push({ sections, sourceExample, example: sections.EXAMPLES || sourceExample });
  });
  return { documents, diagnostics };
}

function highlightCode(source) {
  const control = /^(?:IF|ELSEIF|ELSE|ENDIF|END|DO|WHILE|ENDDO|FOR|EACH|IN|TO|STEP|NEXT|ENDFOR|LOOP|EXIT|BREAK|SWITCH|CASE|ENDCASE|OTHERWISE|ENDSWITCH|ENUM|ENDENUM|BEGIN|SEQUENCE|RECOVER|USING|ENDSEQUENCE|WITH)$/i;
  const declarations = /^(?:FUNCTION|PROCEDURE|RETURN|LOCAL|STATIC|FIELD|REQUEST|EXTERNAL|ANNOUNCE|AS|PTR|PSZ|INT8|INT16|INT32|INT64|UINT8|UINT16|UINT32|UINT64|INT|FLOAT32|FLOAT64|FLOAT|LOGIC|STRING|DATE|ARRAY|HASH|CODEBLOCK|OBJECT|STRUCT|ANY|NULL|CLASS|METHOD|DATA|PUBLIC|PRIVATE|DEFAULT|INIT|DLL|CLASSMETHOD|ACCESS|ASSIGN|DESTRUCTOR|ONERROR)$/i;
  const commands = /^(?:USE|INDEX|ALIAS|EXCLUSIVE|SHARED|NEW|READONLY|VIA|APPEND|BLANK|REPLACE|CLOSE|DATABASES|SELECT)$/i;
  const tokens = /(\/\*[\s\S]*?(?:\*\/|$)|\/\/[^\n]*|&&[^\n]*|^[\t ]*\*[^\n]*|^[\t ]*NOTE\b[^\n]*|\be"(?:\\.|[^"\n])*"|\be'(?:\\.|[^'\n])*'|"[^"\n]*"|'[^'\n]*'|\.(?:T|F|AND|OR|NOT)\.|#[a-z]+\b|\b0x[\da-f]+\b|\b\d+(?:\.\d+)?(?:e[+-]?\d+)?\b|(?<![\w.])\.\d+(?:e[+-]?\d+)?\b|\b[a-z_]\w*\b|:=|\+=|-=|\*=|\/=|%=|\^=|==|!=|<=|>=|<>|->|::|\+\+|--|\*\*|[+\-*/%^=<>#$!@])/gim;
  let output = ''; let offset = 0;
  for (const match of String(source).matchAll(tokens)) {
    output += escapeHtml(source.slice(offset, match.index));
    const token = match[0];
    let kind = '';
    const called = /^\s*\(/.test(source.slice(match.index + token.length));
    const linePrefix = source.slice(source.lastIndexOf('\n', match.index - 1) + 1, match.index);
    if (/^(?:\/\*|\/\/|&&)/.test(token) || (/^[\t ]*(?:\*|NOTE\b)/i.test(token) && /^[\t ]*$/.test(linePrefix))) kind = 'comment';
    else if (/^(?:e?["'])/i.test(token)) kind = 'string';
    else if (/^(?:\d|\.\d)/.test(token)) kind = 'number';
    else if (/^(?:NIL|SELF|SUPER|\.[TF]\.)$/i.test(token)) kind = 'literal';
    else if (/^#[a-z]/i.test(token)) kind = 'directive';
    else if (/^\.(?:AND|OR|NOT)\.$/i.test(token) || token === '!') kind = 'control';
    else if (called && /^(?:IF|ARRAY|DATE|HASH)$/i.test(token)) kind = 'function';
    else if (control.test(token) || commands.test(token)) kind = 'control';
    else if (declarations.test(token)) kind = 'keyword';
    else if (/^[a-z_]\w*$/i.test(token)) {
      if (/^(?:[A-Z][A-Z0-9]*(?:_[A-Z0-9]+)+|_[A-Za-z][A-Za-z0-9_]*)$/.test(token)) kind = 'constant';
      else if (called || /\b(?:FUNCTION|PROCEDURE|METHOD|CLASSMETHOD|ACCESS|ASSIGN|DESTRUCTOR|ONERROR)\s+$/i.test(source.slice(0, match.index))) kind = 'function';
      else kind = 'variable';
    } else kind = 'operator';
    const classes = ['control', 'directive'].includes(kind) ? `token-keyword token-${kind}` : `token-${kind}`;
    output += `<span class="${classes}">${escapeHtml(token)}</span>`;
    offset = match.index + token.length;
  }
  return output + escapeHtml(source.slice(offset));
}

function renderDoc(sections) {
  return `<article><h1>${escapeHtml(sections.NAME)}</h1>${KNOWN_SECTIONS
    .filter(name => !['NAME', 'CATEGORY', 'TEMPLATE'].includes(name) && sections[name])
    .map(name => `<section><h2>${escapeHtml(name)}</h2><pre>${escapeHtml(sections[name])}</pre></section>`).join('')}</article>`;
}

function wrapHtml(body, title = 'xDev Documentation') {
  return `<!doctype html><html lang="en"><head><meta charset="utf-8"><title>${escapeHtml(title)}</title></head><body>${body}</body></html>`;
}

function parseSourceToHtml(source, title) {
  const { documents, diagnostics } = parseSource(source);
  return { count: documents.length, diagnostics,
    html: wrapHtml(documents.map(doc => renderDoc({ ...doc.sections, EXAMPLES: doc.example })).join('\n'), title) };
}

module.exports = { KNOWN_SECTIONS, escapeHtml, inlineMarkdown, extractDocBlocks, parseSections,
  parseSource, highlightCode, renderDoc, wrapHtml, parseSourceToHtml };
