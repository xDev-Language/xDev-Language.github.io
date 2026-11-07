/*
 * $DOC$
 * $NAME$
 * Periods()
 *
 * $ONELINER$
 * Calculate the duration for paying back a loan at fixed interest rate and payments
 *
 * $SYNTAX$
 * Periods( nLoan, nPayBack, nInterestRate ) --> nDuration
 *
 * $ARGUMENTS$
 * nLoan
 * nPayBack
 * nInterestRate
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

   Check( 'Round( Periods( 4000, 200, nMonthlyRate ), 2 ) ', Round( Periods( 4000, 200, nMonthlyRate ), 2 ), 21.86 )
   Check( 'Periods( 1200, 100, 0 )                        ', Periods( 1200, 100, 0 ), 12 )
   Check( 'Periods( 4000, 20, nMonthlyRate )              ', Periods( 4000, 20, nMonthlyRate ), -1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
