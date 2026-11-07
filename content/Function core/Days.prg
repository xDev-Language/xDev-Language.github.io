/*
 * $DOC$
 * $NAME$
 * Days()
 *
 * $ONELINER$
 * Calculate the number of days from elapsed seconds
 *
 * $SYNTAX$
 * Days( nSeconds ) --> nDays
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

   Check( 'Days( 200000 ) ', Days( 200000 ), 2 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
