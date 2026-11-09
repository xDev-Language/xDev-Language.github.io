/*
 * $DOC$
 * $NAME$
 * Abs()
 *
 * $ONELINER$
 * Return the absolute value of a numeric expression
 *
 * $SYNTAX$
 * Abs( nExp ) --> nPositive
 *
 * $ARGUMENTS$
 * nExp
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
 * Abs( -5 )                  OK
 * Abs( 3.5 )                 OK
 * Abs( nToday - nYesterday ) OK
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

   LOCAL nYesterday := 12
   LOCAL nToday     := 7

   Check( 'Abs( -5 )                  ', Abs( -5 ), 5 )
   Check( 'Abs( 3.5 )                 ', Abs( 3.5 ), 3.5 )
   Check( 'Abs( nToday - nYesterday ) ', Abs( nToday - nYesterday ), 5 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
