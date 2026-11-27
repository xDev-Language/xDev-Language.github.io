/*
 * $DOC$
 * $NAME$
 * svgRect()
 *
 * $ONELINER$
 * Draw the outline of a rectangle
 *
 * $SYNTAX$
 * svgRect( nSvg, nX, nY, nWidth, nHeight, [nRadius], [cColor] ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `nX` Left edge.
 * `nY` Top edge.
 * `nWidth` Rectangle width in SVG units.
 * `nHeight` Rectangle height in SVG units.
 * `nRadius` Optional corner radius in SVG units. Omit it or pass `0` for sharp corners.
 * `cColor` Optional SVG stroke color. Omit it or pass `NIL` to use the pen color.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * The outline uses the current pen and is centered on the boundary. The rectangle has no fill. With a positive radius, both corner radii are set to that value. `cColor` changes only the color of this outline and does not change the pen.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPen(), svgFilledRect(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "rect.svg", 240, 160 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgPen( nSvg, 4, "black" )
   svgRect( nSvg, 20, 20, 200, 120, 16, "#264D73" )
   svgClose( nSvg )

RETURN
