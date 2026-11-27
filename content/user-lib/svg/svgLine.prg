/*
 * $DOC$
 * $NAME$
 * svgLine()
 *
 * $ONELINER$
 * Draw a straight line segment
 *
 * $SYNTAX$
 * svgLine( nSvg, nX1, nY1, nX2, nY2, [cColor] ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `nX1` Horizontal coordinate of the start point.
 * `nY1` Vertical coordinate of the start point.
 * `nX2` Horizontal coordinate of the end point.
 * `nY2` Vertical coordinate of the end point.
 * `cColor` Optional SVG stroke color. Omit it or pass `NIL` to use the pen color.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Draws the line using the pen set by `svgPen()`. `cColor` changes only the
 * color of this line and does not change the pen. The stroke width and round
 * line ends still come from the pen.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPen(), svgPath(), svgRect(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "line.svg", 240, 160 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgPen( nSvg, 6, "black", .T. )
   svgLine( nSvg, 30, 130, 210, 30, "#264D73" )
   svgClose( nSvg )

RETURN
