'use strict';

const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { inflateSync } = require('node:zlib');

const file = fs.readFileSync(path.join(__dirname, '../assets/fonts/xdev-9x18.woff'));
const tables = new Map();
assert.equal(file.toString('ascii', 0, 4), 'wOFF');
assert.equal(file.readUInt32BE(8), file.length);
for (let index = 0; index < file.readUInt16BE(12); index++) {
  const record = 44 + index * 20;
  const tag = file.toString('ascii', record, record + 4);
  const offset = file.readUInt32BE(record + 4);
  const compressed = file.readUInt32BE(record + 8);
  const length = file.readUInt32BE(record + 12);
  const bytes = file.subarray(offset, offset + compressed);
  const data = compressed < length ? inflateSync(bytes) : bytes;
  assert.equal(data.length, length);
  tables.set(tag, data);
}

test('web font keeps fixed 9x18 cell metrics', () => {
  const units = tables.get('head').readUInt16BE(18);
  const header = tables.get('hhea');
  assert.equal(units, 18 * 64);
  assert.equal(header.readInt16BE(4) - header.readInt16BE(6), units);
  assert.equal(header.readInt16BE(8), 0);
  assert.equal(tables.get('post').readUInt32BE(12), 1);
  for (let index = 0; index < header.readUInt16BE(34); index++) {
    assert.equal(tables.get('hmtx').readUInt16BE(index * 4) * 18 / units, 9);
  }
});

test('web font includes Polish letters, terminal frames and mathematical symbols', () => {
  const cmap = tables.get('cmap');
  let offset;
  for (let index = 0; index < cmap.readUInt16BE(2); index++) {
    const record = 4 + index * 8;
    if (cmap.readUInt16BE(record) === 3 && cmap.readUInt16BE(record + 2) === 1) offset = cmap.readUInt32BE(record + 4);
  }
  assert.notEqual(offset, undefined);
  const map = cmap.subarray(offset);
  assert.equal(map.readUInt16BE(0), 4);
  const count = map.readUInt16BE(6) / 2;
  function glyph(point) {
    for (let index = 0; index < count; index++) {
      const end = map.readUInt16BE(14 + index * 2);
      const start = map.readUInt16BE(16 + count * 2 + index * 2);
      if (point < start || point > end) continue;
      const delta = map.readInt16BE(16 + count * 4 + index * 2);
      const location = 16 + count * 6 + index * 2;
      const range = map.readUInt16BE(location);
      if (!range) return (point + delta) & 0xFFFF;
      const value = map.readUInt16BE(location + range + (point - start) * 2);
      return value ? (value + delta) & 0xFFFF : 0;
    }
    return 0;
  }
  for (const character of 'ĄĆĘŁŃÓŚŹŻąćęłńóśźż┌─┐│└┘┬┴├┤┼╔═╗║╚╝αβγ∑∞≤≥') {
    assert.notEqual(glyph(character.codePointAt(0)), 0, character);
  }
});
