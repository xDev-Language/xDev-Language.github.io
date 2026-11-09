/*
 * $DOC$
 * $NAME$
 * Fact()
 *
 * $ONELINER$
 * Calculate the factorial of a number
 *
 * $SYNTAX$
 * Fact( nInteger ) --> nFactorial
 *
 * $ARGUMENTS$
 * nInteger
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
 * Fact( 0 )  OK
 * Fact( 1 )  OK
 * Fact( 5 )  OK
 * Fact( 20 ) OK
 * Fact( 21 ) OK
 * Fact( 25 ) OK
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

   Check( 'Fact( 0 )  ', Fact( 0 ), 1 )
   Check( 'Fact( 1 )  ', Fact( 1 ), 1 )
   Check( 'Fact( 5 )  ', Fact( 5 ), 120 )
   Check( 'Fact( 20 ) ', Fact( 20 ), 2432902008176640000 )
   Check( 'Fact( 21 ) ', Fact( 21 ), 51090942171709440000 )
   Check( 'Fact( 25 ) ', Fact( 25 ), -1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
