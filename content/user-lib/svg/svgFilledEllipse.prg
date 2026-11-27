/*
 * $DOC$
 * $NAME$
 * svgFilledEllipse()
 *
 * $ONELINER$
 * Draw a filled ellipse
 *
 * $SYNTAX$
 * svgFilledEllipse( nSvg, nCx, nCy, nRx, nRy, cColor ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `nCx` Horizontal coordinate of the center.
 * `nCy` Vertical coordinate of the center.
 * `nRx` Horizontal radius in SVG units.
 * `nRy` Vertical radius in SVG units.
 * `cColor` SVG fill color, such as `"#264D73"` or `"currentColor"`.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Fills the ellipse with the supplied color.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgEllipse(), svgFilledCircle(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "filled-ellipse.svg", 240, 160 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgFilledEllipse( nSvg, 120, 80, 90, 50, "#264D73" )
   svgClose( nSvg )

RETURN
