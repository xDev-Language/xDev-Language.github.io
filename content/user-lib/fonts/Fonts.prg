/*
 * $DOC$
 * $NAME$
 * Fonts
 *
 * $ONELINER$
 * Built-in bitmap fonts and the BDF conversion tool
 *
 * $SYNTAX$
 * #include "xfont9x15.h"
 * #include "xfont9x18.h"
 *
 * $ARGUMENTS$
 * None. This user library provides C header resources and a conversion tool,
 * not callable xDev functions.
 *
 * $RETURNS$
 * No runtime value. The headers provide font data to terminal and GUI libraries.
 *
 * $DESCRIPTION$
 * The `fonts` user library contains the fixed-cell Unicode bitmap fonts used by
 * xDev terminal and GUI libraries. `xfont9x15.h` contains a 9 by 15 pixel font
 * and `xfont9x18.h` contains a 9 by 18 pixel font. The data is compiled into
 * the libraries that include these headers; an application normally does not
 * call the font resources directly.
 *
 * `bdf_to_xfont.c` converts a fixed-cell BDF font into an xDev header. It reads
 * a BDF input file, validates the glyph dimensions and writes a C header with
 * the glyph bitmap and metadata. Build the converter as a standalone utility:
 *
 *     clang -std=c11 -O2 -Wall -Wextra -pedantic bdf_to_xfont.c -o bdf_to_xfont.exe
 *     bdf_to_xfont.exe font.bdf xfont.h
 *
 * The generated header is a source resource. It must be included by a C
 * library that knows the xDev font data layout; it is not an xDev program file.
 *
 * $NOTES$
 * `GTGLFW`, `GTSDL3` and the GUI library include `xfont9x18.h`. The X11 driver
 * can use its platform font when the built-in resource is unavailable. Keep
 * generated headers in the library source tree and rebuild the consuming
 * library after replacing a font.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Fonts library
 * xfont9x15.h: 9 x 15 bitmap font
 * xfont9x18.h: 9 x 18 bitmap font
 * Converter: bdf_to_xfont.c
 *
 * $CATEGORY$
 * User libraries Fonts
 *
 * $HEADER$
 *
 * $SEEALSO$
 * GTGLFW, GTSDL3, GTWVT, GTXWC, gui_Font
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( "Fonts library" )
   QOut( "xfont9x15.h: 9 x 15 bitmap font" )
   QOut( "xfont9x18.h: 9 x 18 bitmap font" )
   QOut( "Converter: bdf_to_xfont.c" )

RETURN
