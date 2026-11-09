/*
 * $DOC$
 * $NAME$
 * DaysInMonth()
 *
 * $ONELINER$
 * Return the number of days in a month
 *
 * $SYNTAX$
 * DaysInMonth( nMonth, [lLeapYear] ) --> nDaysInMonth
 *
 * $ARGUMENTS$
 * nMonth
 * lLeapYear
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
 * DaysInMonth( 2 )      OK
 * DaysInMonth( 2, .T. ) OK
 * DaysInMonth( 11 )     OK
 * DaysInMonth( 13 )     OK
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

   Check( 'DaysInMonth( 2 )      ', DaysInMonth( 2 ), 28 )
   Check( 'DaysInMonth( 2, .T. ) ', DaysInMonth( 2, .T. ), 29 )
   Check( 'DaysInMonth( 11 )     ', DaysInMonth( 11 ), 30 )
   Check( 'DaysInMonth( 13 )     ', DaysInMonth( 13 ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
