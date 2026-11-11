/*
 * $DOC$
 * $NAME$
 * MilliSec()
 *
 * $ONELINER$
 * Define a time delay in milliseconds
 *
 * $SYNTAX$
 * MilliSec( nMilliSeconds ) --> cNull
 *
 * $ARGUMENTS$
 * nMilliSeconds
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
 * Round( Seconds() - nStart, 2 ) >= 0.2 OK
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

   LOCAL nStart := Seconds()

   MilliSec( 200 )

   Check( 'Round( Seconds() - nStart, 2 ) >= 0.2 ', Round( Seconds() - nStart, 2 ) >= 0.2, .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
