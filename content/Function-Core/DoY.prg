/*
 * $DOC$
 * $NAME$
 * DoY()
 *
 * $ONELINER$
 * Return the day number of a date in its year
 *
 * $SYNTAX$
 * DoY( [dDate] ) --> nDayOfYear
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
 * DoY( SToD( "20260101" ) ) OK
 * DoY( SToD( "20261102" ) ) OK
 * DoY( SToD( "20241231" ) ) OK
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

   Check( 'DoY( SToD( "20260101" ) ) ', DoY( SToD( "20260101" ) ), 1 )
   Check( 'DoY( SToD( "20261102" ) ) ', DoY( SToD( "20261102" ) ), 306 )
   Check( 'DoY( SToD( "20241231" ) ) ', DoY( SToD( "20241231" ) ), 366 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
