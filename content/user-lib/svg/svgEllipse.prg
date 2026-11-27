/*
 * $DOC$
 * $NAME$
 * svgEllipse()
 *
 * $ONELINER$
 * Draw the outline of an ellipse
 *
 * $SYNTAX$
 * svgEllipse( nSvg, nCx, nCy, nRx, nRy, [cColor] ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `nCx` Horizontal coordinate of the center.
 * `nCy` Vertical coordinate of the center.
 * `nRx` Horizontal radius in SVG units.
 * `nRy` Vertical radius in SVG units.
 * `cColor` Optional SVG stroke color. Omit it or pass `NIL` to use the pen color.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * The outline uses the current pen and is centered on the boundary. The ellipse has no fill. `cColor` changes only the color of this outline and does not change the pen.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPen(), svgFilledEllipse(), svgCircle(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "ellipse.svg", 240, 160 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgPen( nSvg, 4, "black" )
   svgEllipse( nSvg, 120, 80, 90, 50, "#264D73" )
   svgClose( nSvg )

RETURN
