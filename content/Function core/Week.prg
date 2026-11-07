/*
 * $DOC$
 * $NAME$
 * Week()
 *
 * $ONELINER$
 * Calculate the numeric calendar week from a date
 *
 * $SYNTAX$
 * Week( [dDate] ) --> nWeekOfYear
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

   Check( 'Week( SToD( "20261102" ) ) ', Week( SToD( "20261102" ) ), 45 )
   Check( 'Week( SToD( "20270101" ) ) ', Week( SToD( "20270101" ) ), 53 )
   Check( 'Week( SToD( "20241230" ) ) ', Week( SToD( "20241230" ) ), 1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
