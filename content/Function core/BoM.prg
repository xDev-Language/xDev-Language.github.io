/*
 * $DOC$
 * $NAME$
 * BoM()
 *
 * $ONELINER$
 * Return the date of the first day of a month
 *
 * $SYNTAX$
 * BoM( [dDate] ) --> dFirstDayOfMonth
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

   Check( 'BoM( SToD( "20261115" ) ) ', BoM( SToD( "20261115" ) ), SToD( "20261101" ) )
   Check( 'BoM()                     ', BoM(), BoM( Date() ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
