/*
 * $DOC$
 * $NAME$
 * MDY()
 *
 * $ONELINER$
 * Format a date as "Month dd, yy"
 *
 * $SYNTAX$
 * MDY( [dDate] ) --> cDate
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
 * MDY( SToD( "20261102" ) ) OK
 * MDY( SToD( "20261102" ) ) OK
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

   Check( 'MDY( SToD( "20261102" ) ) ', MDY( SToD( "20261102" ) ), "November 2, 26" )

   SetCentury( .T. )

   Check( 'MDY( SToD( "20261102" ) ) ', MDY( SToD( "20261102" ) ), "November 2, 2026" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
