/*
 * $DOC$
 * $NAME$
 * svgFilledPath()
 *
 * $ONELINER$
 * Draw a filled shape from SVG path data
 *
 * $SYNTAX$
 * svgFilledPath( nSvg, cPath, cColor ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `cPath` SVG path data, for example `M 4 12 A 8 8 0 0 1 20 12`.
 * `cColor` SVG fill color, such as `"#264D73"` or `"currentColor"`.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Writes the path data to the SVG with the supplied fill color. See `svgPath()` for examples of path commands.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPath(), svgFilledPolygon(), svgFilledPie(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "filled-path.svg", 200, 200 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgFilledPath( nSvg, "M 100 20 L 180 180 L 20 180 Z", "#264D73" )
   svgClose( nSvg )

RETURN
