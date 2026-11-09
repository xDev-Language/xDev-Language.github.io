/*
 * $DOC$
 * $NAME$
 * EoQ()
 *
 * $ONELINER$
 * Return the date of the last day of a quarter
 *
 * $SYNTAX$
 * EoQ( [dDate] ) --> dEndOfQuarter
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
 * EoQ( SToD( "20261115" ) ) OK
 * EoQ( SToD( "20240210" ) ) OK
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

   Check( 'EoQ( SToD( "20261115" ) ) ', EoQ( SToD( "20261115" ) ), SToD( "20261231" ) )
   Check( 'EoQ( SToD( "20240210" ) ) ', EoQ( SToD( "20240210" ) ), SToD( "20240331" ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
