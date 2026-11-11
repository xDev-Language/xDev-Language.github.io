/*
 * $DOC$
 * $NAME$
 * ATan()
 *
 * $ONELINER$
 * Calculate the arc tangent in radians
 *
 * $SYNTAX$
 * ATan( nValue ) --> nRadians
 *
 * $ARGUMENTS$
 * nValue
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
 * ATan( 0 )                     OK
 * Round( ATan( Pi() / 4 ), 6 )  OK
 * Round( RToD( ATan( 1 ) ), 6 ) OK
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

   Check( 'ATan( 0 )                     ', ATan( 0 ), 0 )
   Check( 'Round( ATan( Pi() / 4 ), 6 )  ', Round( ATan( Pi() / 4 ), 6 ), 0.665774 )
   Check( 'Round( RToD( ATan( 1 ) ), 6 ) ', Round( RToD( ATan( 1 ) ), 6 ), 45 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
