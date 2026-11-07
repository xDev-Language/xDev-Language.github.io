/*
 * $DOC$
 * $NAME$
 * GetPairLen()
 *
 * $ONELINER$
 * Return the length of a color value within a color string
 *
 * $SYNTAX$
 * GetPairLen( cColorString, nPos ) --> nLength
 *
 * $ARGUMENTS$
 * cColorString
 * nPos
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cColors := "W/N,N/W,W+/B"

   Check( 'GetPairLen( cColors, 1 ) ', GetPairLen( cColors, 1 ), 3 )
   Check( 'GetPairLen( cColors, 3 ) ', GetPairLen( cColors, 3 ), 4 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
