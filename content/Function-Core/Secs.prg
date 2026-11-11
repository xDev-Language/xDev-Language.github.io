/*
 * $DOC$
 * $NAME$
 * Secs()
 *
 * $ONELINER$
 * Calculate the number of seconds from a time string
 *
 * $SYNTAX$
 * Secs( cTime | dDateTime ) --> nSeconds
 *
 * $ARGUMENTS$
 * cTime | dDateTime
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
 * Secs( "01:01:01" ) OK
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

   Check( 'Secs( "01:01:01" ) ', Secs( "01:01:01" ), 3661 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
