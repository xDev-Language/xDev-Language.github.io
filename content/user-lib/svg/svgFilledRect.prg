/*
 * $DOC$
 * $NAME$
 * svgFilledRect()
 *
 * $ONELINER$
 * Draw a filled rectangle
 *
 * $SYNTAX$
 * svgFilledRect( nSvg, nX, nY, nWidth, nHeight, cColor, [nRadius] ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `nX` Left edge.
 * `nY` Top edge.
 * `nWidth` Rectangle width in SVG units.
 * `nHeight` Rectangle height in SVG units.
 * `cColor` SVG fill color, such as `"#264D73"` or `"currentColor"`.
 * `nRadius` Optional corner radius in SVG units. Omit it or pass `0` for sharp corners.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Fills the rectangle with the supplied color. With a positive radius, both corner radii are set to that value.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgRect(), svgFilledPolygon(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "filled-rect.svg", 240, 160 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgFilledRect( nSvg, 20, 20, 200, 120, "#264D73", 16 )
   svgClose( nSvg )

RETURN
