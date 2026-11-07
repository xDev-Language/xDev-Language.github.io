#!/usr/bin/env python3
"""Convert the xDev 9x18 header to a fixed-cell WOFF font. Requires fontTools."""

import argparse
import hashlib
import json
from pathlib import Path
import re

from fontTools.fontBuilder import FontBuilder
from fontTools.pens.ttGlyphPen import TTGlyphPen
from fontTools.ttLib import TTFont, newTable


WIDTH = 9
HEIGHT = 18
ASCENT = 14
SCALE = 64


def read_header(path):
    data = path.read_bytes()
    text = data.decode("utf-8-sig")
    for name, expected in [("WIDTH", WIDTH), ("HEIGHT", HEIGHT)]:
        match = re.search(rf"#define\s+X_FONT9X18_{name}\s+(\d+)", text)
        if not match or int(match[1]) != expected:
            raise ValueError(f"Expected a {WIDTH}x{HEIGHT} font header")
    points = re.search(r"s_font9x18Codepoints[^=]*=\s*\{(.*?)\};", text, re.S)
    bitmaps = re.search(r"s_font9x18Bitmaps[^=]*=\s*\{(.*?)\};", text, re.S)
    if not points or not bitmaps:
        raise ValueError("Font tables not found")
    codepoints = [int(value, 16) for value in re.findall(r"0x([0-9A-Fa-f]+)", points[1])]
    rows = re.findall(r"\{([^}]+)\}\s*,?\s*/\*\s*U\+([0-9A-Fa-f]+)\s*\*/", bitmaps[1])
    declared = re.search(r"#define\s+X_FONT9X18_GLYPH_COUNT\s+(\d+)", text)
    if not declared or len(codepoints) != int(declared[1]) or len(rows) != len(codepoints):
        raise ValueError("Font table lengths differ")
    glyphs = {}
    for point, (values, comment) in zip(codepoints, rows):
        bitmap = [int(value, 16) for value in re.findall(r"0x([0-9A-Fa-f]+)", values)]
        if point != int(comment, 16) or point in glyphs or len(bitmap) != HEIGHT:
            raise ValueError(f"Invalid bitmap for U+{point:04X}")
        if any(value & ((1 << (16 - WIDTH)) - 1) for value in bitmap):
            raise ValueError(f"Pixels outside the cell for U+{point:04X}")
        glyphs[point] = bitmap
    return glyphs, hashlib.sha256(data).hexdigest()


def rectangles(bitmap):
    active = {}
    for y in range(HEIGHT + 1):
        runs = set()
        if y < HEIGHT:
            x = 0
            while x < WIDTH:
                if not bitmap[y] & (0x8000 >> x):
                    x += 1
                    continue
                start = x
                while x < WIDTH and bitmap[y] & (0x8000 >> x):
                    x += 1
                runs.add((start, x))
        for run, start in list(active.items()):
            if run not in runs:
                yield run[0], start, run[1], y
                del active[run]
        for run in sorted(runs):
            active.setdefault(run, y)


def outline(bitmap):
    pen = TTGlyphPen(None)
    for x0, y0, x1, y1 in rectangles(bitmap):
        left, right = x0 * SCALE, x1 * SCALE
        bottom, top = (ASCENT - y1) * SCALE, (ASCENT - y0) * SCALE
        pen.moveTo((left, bottom))
        pen.lineTo((left, top))
        pen.lineTo((right, top))
        pen.lineTo((right, bottom))
        pen.closePath()
    return pen.glyph()


def build_font(bitmaps, source_hash, destination):
    names = {point: f"uni{point:04X}" for point in bitmaps}
    glyphs = {".notdef": outline(bitmaps.get(0xFFFD, bitmaps[0]))}
    glyphs.update({names[point]: outline(bitmap) for point, bitmap in bitmaps.items()})
    builder = FontBuilder(HEIGHT * SCALE, isTTF=True)
    builder.setupGlyphOrder(list(glyphs))
    builder.setupCharacterMap(names)
    builder.setupGlyf(glyphs)
    builder.setupHorizontalMetrics({name: (WIDTH * SCALE, getattr(glyph, "xMin", 0)) for name, glyph in glyphs.items()})
    builder.setupHorizontalHeader(ascent=ASCENT * SCALE, descent=(ASCENT - HEIGHT) * SCALE, lineGap=0)
    builder.setupNameTable({
        "familyName": "xDev 9x18", "styleName": "Regular", "fullName": "xDev 9x18 Regular",
        "psName": "xDev9x18-Regular", "uniqueFontIdentifier": "xDev9x18:" + source_hash[:16],
        "version": "Version 1.000", "copyright": "Public domain font. Share and enjoy.",
        "licenseDescription": "Public domain font. Share and enjoy.",
        "description": "Fixed 9x18 cells converted from xDev user-lib/fonts/xfont9x18.h. SHA-256: " + source_hash
    })
    builder.setupOS2(version=4, fsType=0, fsSelection=0xC0, usWeightClass=400,
                     sTypoAscender=ASCENT * SCALE, sTypoDescender=(ASCENT - HEIGHT) * SCALE,
                     sTypoLineGap=0, usWinAscent=ASCENT * SCALE, usWinDescent=(HEIGHT - ASCENT) * SCALE,
                     xAvgCharWidth=WIDTH * SCALE)
    builder.setupPost(isFixedPitch=1, keepGlyphNames=False)
    builder.font["head"].created = builder.font["head"].modified = 2082844800
    gasp = newTable("gasp")
    gasp.gaspRange = {65535: 0}
    builder.font["gasp"] = gasp
    builder.font.flavor = "woff"
    destination.parent.mkdir(parents=True, exist_ok=True)
    builder.save(destination)


def verify_font(destination, bitmaps):
    import freetype

    font = TTFont(destination)
    if set(font.getBestCmap()) != set(bitmaps):
        raise ValueError("The web font character map differs from the header")
    font.close()
    face = freetype.Face(str(destination))
    face.set_pixel_sizes(0, HEIGHT)
    if face.size.height != HEIGHT * 64:
        raise ValueError("Unexpected line height")
    for point, expected in bitmaps.items():
        face.load_char(point, freetype.FT_LOAD_RENDER | freetype.FT_LOAD_TARGET_MONO | freetype.FT_LOAD_NO_HINTING)
        if face.glyph.advance.x != WIDTH * 64:
            raise ValueError(f"Unexpected advance for U+{point:04X}")
        rendered = [0] * HEIGHT
        bitmap = face.glyph.bitmap
        buffer = bitmap.buffer
        for y in range(bitmap.rows):
            for x in range(bitmap.width):
                if buffer[y * bitmap.pitch + x // 8] & (0x80 >> (x % 8)):
                    target_x = face.glyph.bitmap_left + x
                    target_y = ASCENT - face.glyph.bitmap_top + y
                    if not (0 <= target_x < WIDTH and 0 <= target_y < HEIGHT):
                        raise ValueError(f"Raster exceeds the cell for U+{point:04X}")
                    rendered[target_y] |= 0x8000 >> target_x
        if rendered != expected:
            raise ValueError(f"Raster mismatch for U+{point:04X}")
    print(f"Verified {len(bitmaps)} glyphs pixel for pixel at {WIDTH}x{HEIGHT} using FreeType.")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("header", type=Path)
    parser.add_argument("--output", type=Path, default=Path(__file__).resolve().parents[1] / "assets/fonts/xdev-9x18.woff")
    parser.add_argument("--verify", action="store_true", help="Raster-check every glyph; requires freetype-py")
    args = parser.parse_args()
    bitmaps, source_hash = read_header(args.header)
    build_font(bitmaps, source_hash, args.output)
    if args.verify:
        verify_font(args.output, bitmaps)
    metadata = {"source": "user-lib/fonts/xfont9x18.h", "sourceSha256": source_hash,
                "width": WIDTH, "height": HEIGHT, "glyphs": len(bitmaps), "format": "WOFF"}
    args.output.with_suffix(".json").write_text(json.dumps(metadata, indent=2) + "\n", encoding="utf-8")
    print(f"Generated {args.output} ({args.output.stat().st_size} bytes).")


if __name__ == "__main__":
    main()
