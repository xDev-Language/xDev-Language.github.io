/*
 * $DOC$
 * $NAME$
 * svgCircle()
 *
 * $ONELINER$
 * Draw the outline of a circle
 *
 * $SYNTAX$
 * svgCircle( nSvg, nCx, nCy, nR, [cColor] ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `nCx` Horizontal coordinate of the center.
 * `nCy` Vertical coordinate of the center.
 * `nR` Circle radius in SVG units.
 * `cColor` Optional SVG stroke color. Omit it or pass `NIL` to use the pen color.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * The outline uses the current pen and is centered on the boundary. The circle has no fill. `cColor` changes only the color of this outline and does not change the pen.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPen(), svgFilledCircle(), svgEllipse(), svgArc(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "circle.svg", 200, 200 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgPen( nSvg, 5, "black" )
   svgCircle( nSvg, 100, 100, 70, "#264D73" )
   svgClose( nSvg )

RETURN
