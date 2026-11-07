/*
 * $DOC$
 * $NAME$
 * EoY()
 *
 * $ONELINER$
 * Return the date of the last day of a year
 *
 * $SYNTAX$
 * EoY( [dDate] ) --> dLastDayOfYear
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

   Check( 'EoY( SToD( "20261115" ) ) ', EoY( SToD( "20261115" ) ), SToD( "20261231" ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
