/*
 * $DOC$
 * $NAME$
 * svgFilledPolygon()
 *
 * $ONELINER$
 * Draw a filled polygon
 *
 * $SYNTAX$
 * svgFilledPolygon( nSvg, aPoints, cColor, [nRadius] ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `aPoints` Array of `{ nX, nY }` coordinate pairs in drawing order.
 * `cColor` SVG fill color, such as `"#264D73"` or `"currentColor"`.
 * `nRadius` Optional corner radius in SVG units. Omit it or pass `0` for sharp corners.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Joins the points in order, closes the polygon and fills it with the supplied color. A positive radius rounds corners with tangent arcs. The radius can be reduced on short edges so adjacent arcs fit.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPolygon(), svgFilledPath(), svgFilledRect(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "filled-polygon.svg", 240, 200 )
   LOCAL aPoints := { { 120, 20 }, { 220, 180 }, { 20, 180 } }

   IF nSvg == 0
      RETURN
   ENDIF

   svgFilledPolygon( nSvg, aPoints, "#264D73", 12 )
   svgClose( nSvg )

RETURN
