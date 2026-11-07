/*
 * $DOC$
 * $NAME$
 * PV()
 *
 * $ONELINER$
 * Calculate the present value of future capital, based on periodic investments
 *
 * $SYNTAX$
 * PV( nInvestment, nInterestRate, nPeriods ) --> nPresentValue
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

   LOCAL nMonthlyRate := 0.095 / 12

   Check( 'Round( PV( 175, nMonthlyRate, 24 ), 2 ) ', Round( PV( 175, nMonthlyRate, 24 ), 2 ), 3811.43 )
   Check( 'Round( PV( 175, 0.095, 2 ), 2 )         ', Round( PV( 175, 0.095, 2 ), 2 ), 305.77 )
   Check( 'PV( 100, 0, 12 )                        ', PV( 100, 0, 12 ), 1200 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
