/*
 * $DOC$
 * $NAME$
 * SecondsSleep()
 *
 * $ONELINER$
 * Suspend thread execution for a number of seconds
 *
 * $SYNTAX$
 * SecondsSleep( nSeconds ) --> NIL
 *
 * $ARGUMENTS$
 * nSeconds
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
 * Round( Seconds() - nStart, 2 ) >= 0.5 OK
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

   SecondsSleep( 0.5 )

   Check( 'Round( Seconds() - nStart, 2 ) >= 0.5 ', Round( Seconds() - nStart, 2 ) >= 0.5, .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
