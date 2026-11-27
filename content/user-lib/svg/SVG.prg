/*
 * $DOC$
 * $NAME$
 * Draw an SVG image
 *
 * $ONELINER$
 * Create a scalable vector image from an xDev program
 *
 * $SYNTAX$
 * nSvg := svgInit( cFilename, nWidth, nHeight, [nViewSize] )
 * svgClose( nSvg )
 *
 * $ARGUMENTS$
 * `cFilename` Path of the image file to create.
 * `nWidth` Image width in pixels.
 * `nHeight` Image height in pixels.
 * `nViewSize` Optional size of a square drawing coordinate system.
 * `nSvg` Drawing handle returned by `svgInit()`.
 *
 * $RETURNS$
 * `svgInit()` returns a drawing handle, or `0` when the file cannot be
 * created. `svgClose()` returns `NIL`.
 *
 * $DESCRIPTION$
 * Open a file with `svgInit()`, draw into it, then finish it with
 * `svgClose()`. Every drawing function receives the handle as its first
 * argument. Several files may be open at the same time.
 *
 * Without `nViewSize`, drawing coordinates run from 0 to `nWidth` across and
 * from 0 to `nHeight` down. With a positive `nViewSize`, both axes run from 0
 * to that value and are scaled to the output width and height. This lets an
 * icon use a small, fixed coordinate system at any output size.
 *
 * Outlines and lines use the current pen. A new file starts with a black pen
 * one unit wide. `svgPen()` changes its width, color and line ends for later
 * outlines. Omit the optional last `cColor` argument of an outline, or pass
 * `NIL`, to use the pen color. A color passed there applies only to that object
 * and does not change the pen. Filled shapes and text receive their colors
 * directly.
 *
 * Colors are written as text, for example `"#264D73"`, `"red"` or
 * `"currentColor"`. Text is UTF-8. `svgText()` escapes text and the font name
 * for the image file. Include `svg.ch` to use the `FONT_WEIGHT_*` and
 * `SVG_ALIGN_*` constants.
 *
 * Text alignment constants are `SVG_ALIGN_LEFT` (0), `SVG_ALIGN_CENTER` (1)
 * and `SVG_ALIGN_RIGHT` (2). Font weights are `FONT_WEIGHT_THIN` (100),
 * `FONT_WEIGHT_EXTRA_LIGHT` (200), `FONT_WEIGHT_LIGHT` (300),
 * `FONT_WEIGHT_NORMAL` (400), `FONT_WEIGHT_MEDIUM` (500),
 * `FONT_WEIGHT_SEMI_BOLD` (600), `FONT_WEIGHT_BOLD` (700),
 * `FONT_WEIGHT_EXTRA_BOLD` (800) and `FONT_WEIGHT_BLACK` (900). The header
 * also defines `PI`.
 *
 * Drawing functions:
 * `svgLine()` draws a segment. `svgRect()`, `svgCircle()`, `svgEllipse()` and
 * `svgPolygon()` draw outlines. Their `svgFilled*()` forms draw filled shapes.
 * `svgArc()` draws an arc. `svgPie()` and `svgFilledPie()` draw circular
 * sectors. `svgPath()` and `svgFilledPath()` accept path data. `svgText()`
 * draws text and `svgComment()` writes a comment into the file.
 *
 * $NOTES$
 * Coordinates may be fractional. Angles are degrees: 0 points right and 90
 * points down. A positive sweep goes clockwise. An outline is centred on the
 * edge of its shape.
 *
 * The `svg` user library is available on Windows and Linux.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $HEADER$
 * svg.ch
 *
 * $SEEALSO$
 * svgInit(), svgClose(), svgPen(), svgPath(), svgText()
 *
 * $DOCEND$
 */

#include "svg.ch"

PROCEDURE Main()

   LOCAL nSvg := svgInit( "example.svg", 400, 200 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgFilledRect( nSvg, 0, 0, 400, 200, "#F2F2F2" )
   svgPen( nSvg, 4, "#264D73", .T. )
   svgCircle( nSvg, 100, 100, 60 )
   svgLine( nSvg, 200, 40, 360, 160 )
   svgText( nSvg, 200, 185, "xDev SVG", "sans-serif", 18, ;
      FONT_WEIGHT_BOLD, "#1A3550", SVG_ALIGN_CENTER )
   svgClose( nSvg )

RETURN
