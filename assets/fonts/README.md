# xDev 9x18

`xdev-9x18.woff` is the web version of the fixed-cell bitmap font in
xDev-src's `user-lib/fonts/xfont9x18.h`. All 4766 Unicode characters and
their original pixels are preserved. The source header is unchanged.

Source notice: **Public domain font. Share and enjoy.**

The original header records this BDF SHA-256:
`3A0D57558622EE446E9C0A41AD8622D9CAF44AD6C94C1E484A8AEBF93F4A9796`.
`xdev-9x18.json` records the source header hash and cell dimensions.

At CSS `font-size: 18px`, each character advances exactly 9px, with an
18px line height. Only the Output section uses this font. Program source
continues to use the existing code font.

To regenerate, install fontTools in your chosen Python environment and run:

```sh
python tools/xdev-output-font.py /path/to/xDev-src/user-lib/fonts/xfont9x18.h
```

For verification, install freetype-py and a discoverable FreeType library,
then add `--verify`. This rasterizes every character at its native size
and compares all pixels with the C header.

The generated WOFF file is committed with the assets. Building, publishing
and viewing the documentation require no Python or font-generation packages.
