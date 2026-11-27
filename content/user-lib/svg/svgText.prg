/*
 * $DOC$
 * $NAME$
 * svgText()
 *
 * $ONELINER$
 * Draw UTF-8 text with font and alignment options
 *
 * $SYNTAX$
 * svgText( nSvg, nX, nY, cText, cFont, nSize, nFontWeight, cColor, [nAlign] ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `nX` Horizontal position of the text anchor.
 * `nY` Vertical position of the text baseline.
 * `cText` UTF-8 text to draw.
 * `cFont` Font family name.
 * `nSize` Font size in SVG units.
 * `nFontWeight` Numeric font weight, for example `FONT_WEIGHT_BOLD` from `svg.ch`.
 * `cColor` SVG text color.
 * `nAlign` `SVG_ALIGN_LEFT` (default), `SVG_ALIGN_CENTER` or `SVG_ALIGN_RIGHT` from `svg.ch`.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Writes an SVG text element. The text and font family are XML-escaped. Horizontal alignment determines where the text is placed relative to `nX`.
 *
 * $HEADER$
 * svg.ch
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgInit(), svgClose(), Draw an SVG image
 *
 * $DOCEND$
 */

#include "svg.ch"

PROCEDURE Main()

   LOCAL nSvg := svgInit( "text.svg", 400, 120 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgText( nSvg, 200, 70, "xDev SVG", "sans-serif", 32, ;
      FONT_WEIGHT_BOLD, "#264D73", SVG_ALIGN_CENTER )
   svgClose( nSvg )

RETURN
