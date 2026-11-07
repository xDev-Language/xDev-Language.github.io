/*
 * $DOC$
 * $NAME$
 * GetClrPair()
 *
 * $ONELINER$
 * Extract a color value from a color string
 *
 * $SYNTAX$
 * GetClrPair( cColorString, nPos ) --> cColorValue
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

   Check( 'GetClrPair( cColors, 3 ) ', GetClrPair( cColors, 3 ), "W+/B" )
   Check( 'GetClrPair( cColors, 5 ) ', GetClrPair( cColors, 5 ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
