/*
 * $DOC$
 * $NAME$
 * MilliSeconds()
 *
 * $ONELINER$
 * Return the current UTC time as a Julian timestamp in milliseconds
 *
 * $SYNTAX$
 * MilliSeconds( ) --> nMilliSeconds
 *
 * $ARGUMENTS$
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
 * ValType( nStart )             OK
 * nStart > 0                    OK
 * MilliSec( 50 )                OK
 * MilliSeconds() - nStart >= 50 OK
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

   LOCAL nStart := MilliSeconds()

   Check( 'ValType( nStart )             ', ValType( nStart ), "N" )
   Check( 'nStart > 0                    ', nStart > 0, .T. )
   Check( 'MilliSec( 50 )                ', MilliSec( 50 ), "" )
   Check( 'MilliSeconds() - nStart >= 50 ', MilliSeconds() - nStart >= 50, .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
