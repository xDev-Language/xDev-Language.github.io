/*
 * $DOC$
 * $NAME$
 * LastDayOM()
 *
 * $ONELINER$
 * Return the number of days in a month
 *
 * $SYNTAX$
 * LastDayOM( dDate | nMonth ) --> nDaysInMonth
 *
 * $ARGUMENTS$
 * dDate | nMonth
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
 * LastDayOM( SToD( "20240210" ) ) OK
 * LastDayOM( 11 )                 OK
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

   Check( 'LastDayOM( SToD( "20240210" ) ) ', LastDayOM( SToD( "20240210" ) ), 29 )
   Check( 'LastDayOM( 11 )                 ', LastDayOM( 11 ), 30 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
