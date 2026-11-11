/*
 * $DOC$
 * $NAME$
 * BoY()
 *
 * $ONELINER$
 * Return the date of the first day of a year
 *
 * $SYNTAX$
 * BoY( [dDate] ) --> dFirstDayOfYear
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
 * BoY( SToD( "20261115" ) ) OK
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

   Check( 'BoY( SToD( "20261115" ) ) ', BoY( SToD( "20261115" ) ), SToD( "20260101" ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
