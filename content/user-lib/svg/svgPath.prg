/*
 * $DOC$
 * $NAME$
 * svgPath()
 *
 * $ONELINER$
 * Draw an SVG path with the current pen
 *
 * $SYNTAX$
 * svgPath( nSvg, cPath, [cColor] ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `cPath` SVG path data, for example `M 4 12 A 8 8 0 0 1 20 12`.
 * `cColor` Optional SVG stroke color. Omit it or pass `NIL` to use the pen color.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Writes the path data to the SVG with the current pen and no fill. `cColor`
 * changes only the color of this path and does not change the pen. The other
 * stroke properties come from the pen.
 *
 * Use `M` to move, `L` to draw a line, `A` for an elliptical arc, `Q` for a quadratic curve, `C` for a cubic curve, or `Z` to close a subpath.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPen(), svgFilledPath(), svgArc(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "path.svg", 240, 160 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgPen( nSvg, 5, "black", .T. )
   svgPath( nSvg, "M 20 120 Q 120 10 220 120", "#264D73" )
   svgClose( nSvg )

RETURN
