/*
 * $DOC$
 * $NAME$
 * svgFilledPie()
 *
 * $ONELINER$
 * Draw a filled circular sector
 *
 * $SYNTAX$
 * svgFilledPie( nSvg, nCx, nCy, nR, nStartAngle, nEndAngle, cColor ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `nCx` Horizontal coordinate of the center.
 * `nCy` Vertical coordinate of the center.
 * `nR` Circle radius in SVG units.
 * `nStartAngle` Start angle in degrees. `0` points right and `90` points down.
 * `nEndAngle` End angle in degrees. The sweep is the end angle minus the start angle.
 * `cColor` SVG fill color, such as `"#264D73"` or `"currentColor"`.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Fills the region bounded by the arc and the two radii. A positive sweep goes clockwise and a negative sweep goes counterclockwise. A sweep of 360 degrees or more in either direction draws a filled circle.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPie(), svgArc(), svgFilledCircle(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "filled-pie.svg", 200, 200 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgFilledPie( nSvg, 100, 100, 75, -90, 45, "#264D73" )
   svgClose( nSvg )

RETURN
