/*
 * $DOC$
 * $NAME$
 * FV()
 *
 * $ONELINER$
 * Calculate the future value of constant, periodic investments
 *
 * $SYNTAX$
 * FV( nInvestment, nInterestRate, nPeriods ) --> nFutureValue
 *
 * $ARGUMENTS$
 * nInvestment
 * nInterestRate
 * nPeriods
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
 * Round( FV( 150, nMonthlyRate, 36 ), 2 ) OK
 * FV( 100, 0, 12 )                        OK
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

   LOCAL nMonthlyRate := 0.06 / 12

   Check( 'Round( FV( 150, nMonthlyRate, 36 ), 2 ) ', Round( FV( 150, nMonthlyRate, 36 ), 2 ), 5900.42 )
   Check( 'FV( 100, 0, 12 )                        ', FV( 100, 0, 12 ), 1200 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
