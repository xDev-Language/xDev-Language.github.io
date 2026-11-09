/*
 * $DOC$
 * $NAME$
 * GetPairPos()
 *
 * $ONELINER$
 * Return the absolute position of a color value in a color string
 *
 * $SYNTAX$
 * GetPairPos( cColorString, nPos ) --> nAbsPos
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
 * GetPairPos( cColors, 2 ) OK
 * GetPairPos( cColors, 3 ) OK
 * GetPairPos( cColors, 4 ) OK
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

   Check( 'GetPairPos( cColors, 2 ) ', GetPairPos( cColors, 2 ), 5 )
   Check( 'GetPairPos( cColors, 3 ) ', GetPairPos( cColors, 3 ), 9 )
   Check( 'GetPairPos( cColors, 4 ) ', GetPairPos( cColors, 4 ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
