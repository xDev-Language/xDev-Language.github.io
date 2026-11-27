/*
 * $DOC$
 * $NAME$
 * svgInit()
 *
 * $ONELINER$
 * Create an SVG file and write its header
 *
 * $SYNTAX$
 * svgInit( cFilename, nWidth, nHeight, [nViewSize] ) --> nSvg | 0
 *
 * $ARGUMENTS$
 * `cFilename` Output path. An existing file at this path is truncated.
 * `nWidth` Output width in pixels.
 * `nHeight` Output height in pixels.
 * `nViewSize` Optional side length of the square drawing coordinate system. Supply a positive number to use this size on both axes.
 *
 * $RETURNS$
 * A numeric drawing handle, or `0` if the file could not be created. Use `FError()` to inspect a creation error.
 *
 * $DESCRIPTION$
 * Writes the SVG 1.1 header. The `width` and `height` attributes always come from `nWidth` and `nHeight`.
 * With a positive numeric `nViewSize`, the `viewBox` is `0 0 nViewSize nViewSize`, including when the output dimensions differ.
 * Omit `nViewSize` or pass a nonpositive or nonnumeric value to use `0 0 nWidth nHeight`.
 *
 * Drawing coordinates and stroke widths are expressed in `viewBox` units. For example,
 * `svgInit( "check.svg", 512, 512, 24 )` creates a 512 × 512 pixel icon that you draw in a 24 × 24 coordinate system.
 *
 * The new drawing starts with a black pen one unit wide and flat line ends. Use `svgPen()` to change the pen.
 * Finish the drawing with `svgClose()`.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgPen(), svgClose(), FError(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "check.svg", 512, 512, 24 )

   IF nSvg == 0
      QOut( "Cannot create check.svg", FError() )
      ErrorLevel( 1 )
      RETURN
   ENDIF

   svgPen( nSvg, 2, "currentColor", .T. )
   svgPath( nSvg, "M 5 12 L 10 17 L 19 7" )
   svgClose( nSvg )

RETURN
