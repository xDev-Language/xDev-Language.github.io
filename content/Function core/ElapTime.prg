/*
 * $DOC$
 * $NAME$
 * ElapTime()
 *
 * $ONELINER$
 * Calculate the time elapsed between a start and an end time
 *
 * $SYNTAX$
 * ElapTime( cStartTime, cEndTime ) --> cElapsedTime
 *
 * $ARGUMENTS$
 * cStartTime
 * cEndTime
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

   Check( 'ElapTime( "08:00:00", "16:45:30" ) ', ElapTime( "08:00:00", "16:45:30" ), "08:45:30" )
   Check( 'ElapTime( "23:00:00", "01:30:00" ) ', ElapTime( "23:00:00", "01:30:00" ), "02:30:00" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
