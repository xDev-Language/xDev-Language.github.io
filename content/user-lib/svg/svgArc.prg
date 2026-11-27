/*
 * $DOC$
 * $NAME$
 * svgArc()
 *
 * $ONELINER$
 * Draw an arc of a circle
 *
 * $SYNTAX$
 * svgArc( nSvg, nCx, nCy, nR, nStartAngle, nEndAngle, [cColor] ) --> NIL
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
 * Draws an open arc with the current pen. `cColor` changes only the color of this outline and does not change the pen. A positive sweep goes clockwise and a negative sweep goes counterclockwise. A sweep of 360 degrees or more in either direction draws one full circle using two clockwise half-arcs.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPen(), svgPie(), svgCircle(), svgPath(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "arc.svg", 240, 160 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgPen( nSvg, 4, "black", .T. )
   svgArc( nSvg, 120, 80, 55, 20, 300, "#264D73" )
   svgClose( nSvg )

RETURN
