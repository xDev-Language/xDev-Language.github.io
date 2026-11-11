/*
 * $DOC$
 * $NAME$
 * Rate()
 *
 * $ONELINER$
 * Calculate the interest rate for a loan
 *
 * $SYNTAX$
 * Rate( nLoan, nPayment, nPeriods ) --> nInterestRate
 *
 * $ARGUMENTS$
 * nLoan
 * nPayment
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
 * Round( nMonthly * 12, 4 )                 OK
 * Round( Payment( 2500, nMonthly, 36 ), 2 ) OK
 * Rate( 1200, 100, 12 )                     OK
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

   LOCAL nMonthly := Rate( 2500, 86.67, 36 )

   Check( 'Round( nMonthly * 12, 4 )                 ', Round( nMonthly * 12, 4 ), 0.1501 )
   Check( 'Round( Payment( 2500, nMonthly, 36 ), 2 ) ', Round( Payment( 2500, nMonthly, 36 ), 2 ), 86.67 )
   Check( 'Rate( 1200, 100, 12 )                     ', Rate( 1200, 100, 12 ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
