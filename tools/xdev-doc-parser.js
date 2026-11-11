'use strict';

const KNOWN_SECTIONS = [
  'TEMPLATE',
  'NAME',
  'CATEGORY',
  'ONELINER',
  'SYNTAX',
  'ARGUMENTS',
  'RETURNS',
  'DESCRIPTION',
  'NOTES',
  'EXAMPLES',
  'OUTPUT',
  'IMAGE',
  'HEADER',
  'SEEALSO',
];

const HTML_ESCAPES = {
  '&': '&amp;',
  '<': '&lt;',
  '>': '&gt;',
  '"': '&quot;',
  "'": '&#39;',
};

const CONTROL_KEYWORDS = /^(?:IF|ELSEIF|ELSE|ENDIF|END|DO|WHILE|ENDDO|FOR|EACH|IN|TO|STEP|NEXT|ENDFOR|LOOP|EXIT|BREAK|SWITCH|CASE|ENDCASE|OTHERWISE|ENDSWITCH|ENUM|ENDENUM|BEGIN|SEQUENCE|RECOVER|USING|ENDSEQUENCE|WITH)$/i;

const DECLARATION_KEYWORDS = /^(?:FUNCTION|PROCEDURE|RETURN|LOCAL|STATIC|FIELD|REQUEST|EXTERNAL|ANNOUNCE|AS|PTR|PSZ|INT8|INT16|INT32|INT64|UINT8|UINT16|UINT32|UINT64|INT|FLOAT32|FLOAT64|FLOAT|LOGIC|STRING|DATE|ARRAY|HASH|CODEBLOCK|OBJECT|STRUCT|ANY|NULL|CLASS|METHOD|DATA|PUBLIC|PRIVATE|DEFAULT|INIT|DLL|CLASSMETHOD|ACCESS|ASSIGN|DESTRUCTOR|ONERROR)$/i;

const COMMAND_KEYWORDS = /^(?:USE|INDEX|ALIAS|EXCLUSIVE|SHARED|NEW|READONLY|VIA|APPEND|BLANK|REPLACE|CLOSE|DATABASES|SELECT)$/i;

const CALLED_FUNCTION_KEYWORDS = /^(?:IF|ARRAY|DATE|HASH)$/i;

const CONSTANT_PATTERN = /^(?:[A-Z][A-Z0-9]*(?:_[A-Z0-9]+)+|_[A-Za-z][A-Za-z0-9_]*)$/;

const DEFINITION_PATTERN = /\b(?:FUNCTION|PROCEDURE|METHOD|CLASSMETHOD|ACCESS|ASSIGN|DESTRUCTOR|ONERROR)\s+$/i;

const TOKEN_PATTERN = /(\/\*[\s\S]*?(?:\*\/|$)|\/\/[^\n]*|&&[^\n]*|^[\t ]*\*[^\n]*|^[\t ]*NOTE\b[^\n]*|\be"(?:\\.|[^"\n])*"|\be'(?:\\.|[^'\n])*'|"[^"\n]*"|'[^'\n]*'|\.(?:T|F|AND|OR|NOT)\.|#[a-z]+\b|\b0x[\da-f]+\b|\b\d+(?:\.\d+)?(?:e[+-]?\d+)?\b|(?<![\w.])\.\d+(?:e[+-]?\d+)?\b|\b[a-z_]\w*\b|:=|\+=|-=|\*=|\/=|%=|\^=|==|!=|<=|>=|<>|->|::|\+\+|--|\*\*|[+\-*/%^=<>#$!@])/gim;

function escapeHtml(value) {
  return String(value ?? '').replace(
    /[&<>"']/g,
    (character) => HTML_ESCAPES[character],
  );
}

function inlineMarkdown(value) {
  return String(value ?? '')
    .split(/(`[^`]+`)/g)
    .map((part) => {
      if (part.startsWith('`') && part.endsWith('`')) {
        return `<code>${escapeHtml(part.slice(1, -1))}</code>`;
      }

      return escapeHtml(part)
        .replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>')
        .replace(/\*([^*]+)\*/g, '<em>$1</em>');
    })
    .join('');
}

function docBlocks(source) {
  const blocks = [];

  for (const match of String(source).matchAll(/\/\*[\s\S]*?(?:\*\/|$)/g)) {
    if (/\$DOC\$/.test(match[0])) {
      blocks.push({
        text: match[0],
        start: match.index,
        end: match.index + match[0].length,
      });
    }
  }

  return blocks;
}

function trimBlock(value, dedent = true) {
  const lines = value.replace(/\r\n?/g, '\n').split('\n');

  while (lines.length > 0 && !lines[0].trim()) {
    lines.shift();
  }

  while (lines.length > 0 && !lines.at(-1).trim()) {
    lines.pop();
  }

  let indentation = 0;

  if (dedent) {
    indentation = Math.min(
      ...lines
        .filter((line) => line.trim())
        .map((line) => line.match(/^\s*/)[0].length),
    );

    if (!Number.isFinite(indentation)) {
      indentation = 0;
    }
  }

  return lines.map((line) => line.slice(indentation)).join('\n');
}

function unwrapDocComment(docBlock) {
  return String(docBlock)
    .replace(/^\/\*/, '')
    .replace(/\*\/$/, '')
    .replace(/\r\n?/g, '\n')
    .split('\n')
    .map((line) => line.replace(/^[\t ]*\*(?: )?/, ''));
}

function parseSections(docBlock) {
  const lines = unwrapDocComment(docBlock);
  const sections = {};

  let active = false;
  let currentSection;

  for (const line of lines) {
    const marker = line.match(/^\s*\$([A-Z][A-Z0-9_]*)\$\s*$/);

    if (marker) {
      const name = marker[1];

      if (name === 'DOC') {
        active = true;
        continue;
      }

      if (name === 'DOCEND' || name === 'END') {
        break;
      }

      if (active) {
        currentSection = name;
        sections[currentSection] ??= [];
      }

      continue;
    }

    if (active && currentSection) {
      sections[currentSection].push(line);
    }
  }

  return Object.fromEntries(
    Object.entries(sections).map(([name, sectionLines]) => [
      name,
      trimBlock(sectionLines.join('\n'), name !== 'OUTPUT'),
    ]),
  );
}

function parseSource(source) {
  const text = String(source);
  const blocks = docBlocks(text);
  const diagnostics = [];
  const documents = [];

  for (const [index, block] of blocks.entries()) {
    if (!block.text.endsWith('*/')) {
      diagnostics.push('Documentation comment is missing its closing */.');
      continue;
    }

    if (!/\$(?:DOCEND|END)\$/.test(block.text)) {
      diagnostics.push('Documentation block is missing $DOCEND$.');
      continue;
    }

    const sections = parseSections(block.text);

    if (!sections.NAME) {
      diagnostics.push('Documentation block is missing $NAME$.');
    }

    for (const key of Object.keys(sections)) {
      if (!KNOWN_SECTIONS.includes(key)) {
        diagnostics.push(`Unknown documentation section: ${key}.`);
      }
    }

    const nextBlockStart = blocks[index + 1]?.start ?? text.length;
    const sourceExample = trimBlock(text.slice(block.end, nextBlockStart));

    documents.push({
      sections,
      sourceExample,
      example: sections.EXAMPLES || sourceExample,
    });
  }

  return { documents, diagnostics };
}

// Names declared as constants in the source: ENUM constants and #define names
function declaredConstants(source) {
  const names = new Set();

  for (const block of source.matchAll(/^[\t ]*ENUM\b[^\n]*\n([\s\S]*?)^[\t ]*END(?:ENUM)?\b/gim)) {
    for (const line of block[1].matchAll(/^[\t ]*([a-z_]\w*)/gim)) {
      names.add(line[1].toUpperCase());
    }
  }

  for (const define of source.matchAll(/^[\t ]*#define[\t ]+([a-z_]\w*)/gim)) {
    names.add(define[1].toUpperCase());
  }

  return names;
}

function classifyToken(token, source, index, constants) {
  const called = /^\s*\(/.test(source.slice(index + token.length));

  const lineStart = source.lastIndexOf('\n', index - 1) + 1;
  const linePrefix = source.slice(lineStart, index);

  const startsComment = /^(?:\/\*|\/\/|&&)/.test(token);
  const isLineComment =
    /^[\t ]*(?:\*|NOTE\b)/i.test(token) && /^[\t ]*$/.test(linePrefix);

  if (startsComment || isLineComment) {
    return 'comment';
  }

  if (/^(?:e?["'])/i.test(token)) {
    return 'string';
  }

  if (/^(?:\d|\.\d)/.test(token)) {
    return 'number';
  }

  if (/^(?:NIL|SELF|SUPER|\.[TF]\.)$/i.test(token)) {
    return 'literal';
  }

  if (/^#[a-z]/i.test(token)) {
    return 'directive';
  }

  if (/^\.(?:AND|OR|NOT)\.$/i.test(token) || token === '!') {
    return 'control';
  }

  if (called && CALLED_FUNCTION_KEYWORDS.test(token)) {
    return 'function';
  }

  if (CONTROL_KEYWORDS.test(token) || COMMAND_KEYWORDS.test(token)) {
    return 'control';
  }

  if (DECLARATION_KEYWORDS.test(token)) {
    return 'keyword';
  }

  if (/^[a-z_]\w*$/i.test(token)) {
    if (CONSTANT_PATTERN.test(token) || constants.has(token.toUpperCase())) {
      return 'constant';
    }

    const isDefinition =
      called || DEFINITION_PATTERN.test(source.slice(0, index));

    return isDefinition ? 'function' : 'variable';
  }

  return 'operator';
}

function highlightCode(source) {
  const text = String(source);
  const constants = declaredConstants(text);
  let output = '';
  let offset = 0;

  for (const match of text.matchAll(TOKEN_PATTERN)) {
    output += escapeHtml(text.slice(offset, match.index));

    const token = match[0];
    const kind = classifyToken(token, text, match.index, constants);

    const classes =
      kind === 'control' || kind === 'directive'
        ? `token-keyword token-${kind}`
        : `token-${kind}`;

    output += `<span class="${classes}">${escapeHtml(token)}</span>`;
    offset = match.index + token.length;
  }

  return output + escapeHtml(text.slice(offset));
}

module.exports = {
  escapeHtml,
  inlineMarkdown,
  parseSource,
  highlightCode,
};
