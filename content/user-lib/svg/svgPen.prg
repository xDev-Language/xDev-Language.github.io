/*
 * $DOC$
 * $NAME$
 * svgPen()
 *
 * $ONELINER$
 * Set the pen for subsequent outlines and lines
 *
 * $SYNTAX$
 * svgPen( nSvg, nStrokeWidth, cColor, [lRound] ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `nStrokeWidth` Stroke width in SVG units.
 * `cColor` SVG stroke color, such as `"#264D73"` or `"currentColor"`.
 * `lRound` Pass `.T.` for round line ends and stroke joins. Defaults to `.F.`.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Each open drawing has its own pen. It starts with a black stroke one unit wide, flat ends and the default SVG joins. Calling `svgPen()` changes subsequent lines and outlines in that drawing. Omit the last `cColor` argument of an outline, or pass `NIL`, to use the pen color. A color passed there applies only to that object and does not change the pen. Its stroke width and round ends still come from the pen. Filled shapes and text get their color directly from their function arguments.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgInit(), svgLine(), svgRect(), svgPath(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "pen.svg", 240, 160 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgPen( nSvg, 8, "black", .T. )
   svgLine( nSvg, 30, 40, 210, 40 )
   svgLine( nSvg, 30, 80, 210, 80, "red" )
   svgLine( nSvg, 30, 120, 210, 120 )
   svgClose( nSvg )

RETURN
