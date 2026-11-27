/*
 * $DOC$
 * $NAME$
 * svgComment()
 *
 * $ONELINER$
 * Write an XML comment to an SVG file
 *
 * $SYNTAX$
 * svgComment( nSvg, cComment ) --> NIL
 *
 * $ARGUMENTS$
 * `nSvg` Drawing handle returned by `svgInit()`.
 * `cComment` Comment text.
 *
 * $RETURNS$
 * `NIL`.
 *
 * $DESCRIPTION$
 * Inserts spaces between adjacent hyphens and after a trailing hyphen to keep the comment valid in XML.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries SVG
 *
 * $SEEALSO$
 * svgInit(), svgClose(), Draw an SVG image
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSvg := svgInit( "comment.svg", 200, 120 )

   IF nSvg == 0
      RETURN
   ENDIF

   svgComment( nSvg, "The main shape" )
   svgFilledCircle( nSvg, 100, 60, 40, "#264D73" )
   svgClose( nSvg )

RETURN
