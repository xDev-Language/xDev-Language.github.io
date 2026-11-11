/*
 * $DOC$
 * $NAME$
 * WoM()
 *
 * $ONELINER$
 * Calculate the week number in a month
 *
 * $SYNTAX$
 * WoM( [dDate] ) --> nWeekOfMonth
 *
 * $ARGUMENTS$
 * dDate
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
 * WoM( SToD( "20261101" ) ) OK
 * WoM( SToD( "20261102" ) ) OK
 * WoM( SToD( "20261130" ) ) OK
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

   Check( 'WoM( SToD( "20261101" ) ) ', WoM( SToD( "20261101" ) ), 1 )
   Check( 'WoM( SToD( "20261102" ) ) ', WoM( SToD( "20261102" ) ), 2 )
   Check( 'WoM( SToD( "20261130" ) ) ', WoM( SToD( "20261130" ) ), 6 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
