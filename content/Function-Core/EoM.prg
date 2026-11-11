/*
 * $DOC$
 * $NAME$
 * EoM()
 *
 * $ONELINER$
 * Return the date of the last day of a month
 *
 * $SYNTAX$
 * EoM( [dDate] ) --> dLastDayOfMonth
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
 * EoM( SToD( "20261115" ) ) OK
 * EoM( SToD( "20240210" ) ) OK
 * EoM( SToD( "20260210" ) ) OK
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

   Check( 'EoM( SToD( "20261115" ) ) ', EoM( SToD( "20261115" ) ), SToD( "20261130" ) )
   Check( 'EoM( SToD( "20240210" ) ) ', EoM( SToD( "20240210" ) ), SToD( "20240229" ) )
   Check( 'EoM( SToD( "20260210" ) ) ', EoM( SToD( "20260210" ) ), SToD( "20260228" ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
