/*
 * $DOC$
 * $NAME$
 * svgPolygon()
 *
 * $ONELINER$
 * Draw the outline of a closed polygon
 *
 * $SYNTAX$
 * svgPolygon( nSvg, aPoints, [nRadius], [cColor] ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `aPoints` Array of `{ nX, nY }` coordinate pairs in drawing order.
 * `nRadius` Optional corner radius in SVG units. Omit it or pass `0` for sharp corners.
 * `cColor` Optional SVG stroke color. Omit it or pass `NIL` to use the pen color.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * The outline uses the current pen and is centered on the boundary. The interior has no fill. A positive radius rounds corners with tangent arcs. The radius can be reduced on short edges so adjacent arcs fit. `cColor` changes only the color of this outline and does not change the pen.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPen(), svgFilledPolygon(), svgPath(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "polygon.svg", 240, 200 )
   LOCAL aPoints := { { 120, 20 }, { 220, 180 }, { 20, 180 } }

   IF nSvg == 0
      RETURN
   ENDIF

   svgPen( nSvg, 4, "black", .T. )
   svgPolygon( nSvg, aPoints, 12, "#264D73" )
   svgClose( nSvg )

RETURN
