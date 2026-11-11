/*
 * $DOC$
 * $NAME$
 * BoQ()
 *
 * $ONELINER$
 * Return the date of the first day of a quarter
 *
 * $SYNTAX$
 * BoQ( [dDate] ) --> dFirstDayOfQuarter
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
 * BoQ( SToD( "20261115" ) ) OK
 * BoQ( SToD( "20260331" ) ) OK
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

   Check( 'BoQ( SToD( "20261115" ) ) ', BoQ( SToD( "20261115" ) ), SToD( "20261001" ) )
   Check( 'BoQ( SToD( "20260331" ) ) ', BoQ( SToD( "20260331" ) ), SToD( "20260101" ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
