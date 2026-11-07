/*
 * $DOC$
 * $NAME$
 * Sign()
 *
 * $ONELINER$
 * Convert the sign of a number to a numeric value
 *
 * $SYNTAX$
 * Sign( nNumber ) --> nSign
 *
 * $ARGUMENTS$
 * nNumber
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

   Check( 'Sign( 48335 ) ', Sign( 48335 ), 1 )
   Check( 'Sign( -258 )  ', Sign( -258 ), -1 )
   Check( 'Sign( 0 )     ', Sign( 0 ), 0 )
   Check( 'Sign( -0.5 )  ', Sign( -0.5 ), -1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
