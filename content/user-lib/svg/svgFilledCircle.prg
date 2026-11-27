/*
 * $DOC$
 * $NAME$
 * svgFilledCircle()
 *
 * $ONELINER$
 * Draw a filled circle
 *
 * $SYNTAX$
 * svgFilledCircle( nSvg, nCx, nCy, nR, cColor ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `nCx` Horizontal coordinate of the center.
 * `nCy` Vertical coordinate of the center.
 * `nR` Radius in SVG units.
 * `cColor` SVG fill color.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Writes a circle filled with the supplied color.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgCircle(), svgFilledRect(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "filled-circle.svg", 200, 200 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgFilledCircle( nSvg, 100, 100, 70, "#264D73" )
   svgClose( nSvg )

RETURN
