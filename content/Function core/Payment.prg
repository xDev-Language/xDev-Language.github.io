/*
 * $DOC$
 * $NAME$
 * Payment()
 *
 * $ONELINER$
 * Calculate a periodical payment for loans
 *
 * $SYNTAX$
 * Payment( nLoan, nInterestRate, nPeriods ) --> nPayment
 *
 * $ARGUMENTS$
 * nLoan
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
 * Round( Payment( 2000, nMonthlyRate, 24 ), 2 ) OK
 * Payment( 1200, 0, 12 )                        OK
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

   LOCAL nMonthlyRate := 0.1 / 12

   Check( 'Round( Payment( 2000, nMonthlyRate, 24 ), 2 ) ', Round( Payment( 2000, nMonthlyRate, 24 ), 2 ), 92.29 )
   Check( 'Payment( 1200, 0, 12 )                        ', Payment( 1200, 0, 12 ), 100 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
