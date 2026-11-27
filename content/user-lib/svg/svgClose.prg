/*
 * $DOC$
 * $NAME$
 * svgClose()
 *
 * $ONELINER$
 * Finish an SVG drawing and close its file
 *
 * $SYNTAX$
 * svgClose( nSvg ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Writes the closing SVG tag and closes the file. Call it once after the last drawing operation.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgInit(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "drawing.svg", 200, 120 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgFilledRect( nSvg, 20, 20, 160, 80, "#DCEAF7", 12 )
   svgClose( nSvg )

RETURN
