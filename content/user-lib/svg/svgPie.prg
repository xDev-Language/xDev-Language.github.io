/*
 * $DOC$
 * $NAME$
 * svgPie()
 *
 * $ONELINER$
 * Draw the outline of a circular sector
 *
 * $SYNTAX$
 * svgPie( nSvg, nCx, nCy, nR, nStartAngle, nEndAngle, [cColor] ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `nCx` Horizontal coordinate of the center.
 * `nCy` Vertical coordinate of the center.
 * `nR` Circle radius in SVG units.
 * `nStartAngle` Start angle in degrees. `0` points right and `90` points down.
 * `nEndAngle` End angle in degrees. The sweep is the end angle minus the start angle.
 * `cColor` Optional SVG stroke color. Omit it or pass `NIL` to use the pen color.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * The outline uses the current pen and is centered on the boundary. `cColor` changes only the color of this outline and does not change the pen. It follows a radius from the center to the start point, follows the arc, then closes back to the center. A positive sweep goes clockwise and a negative sweep goes counterclockwise. A sweep of 360 degrees or more in either direction draws a circle outline.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPen(), svgFilledPie(), svgArc(), svgCircle(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "pie.svg", 200, 200 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgPen( nSvg, 4, "black", .T. )
   svgPie( nSvg, 100, 100, 75, -90, 45, "#264D73" )
   svgClose( nSvg )

RETURN
