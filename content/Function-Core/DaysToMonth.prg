/*
 * $DOC$
 * $NAME$
 * DaysToMonth()
 *
 * $ONELINER$
 * Return the number of days from the first of January to the beginning of a month
 *
 * $SYNTAX$
 * DaysToMonth( nMonth, [lLeapYear] ) --> nDays
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
 * DaysToMonth( 1 )      OK
 * DaysToMonth( 3 )      OK
 * DaysToMonth( 3, .T. ) OK
 * DaysToMonth( 12 )     OK
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

   Check( 'DaysToMonth( 1 )      ', DaysToMonth( 1 ), 0 )
   Check( 'DaysToMonth( 3 )      ', DaysToMonth( 3 ), 59 )
   Check( 'DaysToMonth( 3, .T. ) ', DaysToMonth( 3, .T. ), 60 )
   Check( 'DaysToMonth( 12 )     ', DaysToMonth( 12 ), 334 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
