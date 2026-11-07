/*
 * $DOC$
 * $NAME$
 * IsLeap()
 *
 * $ONELINER$
 * Check if a Date value belongs to a leap year
 *
 * $SYNTAX$
 * IsLeap( [dDate] ) --> lIsLeapYear
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

   Check( 'IsLeap( SToD( "20240101" ) ) ', IsLeap( SToD( "20240101" ) ), .T. )
   Check( 'IsLeap( SToD( "20260101" ) ) ', IsLeap( SToD( "20260101" ) ), .F. )
   Check( 'IsLeap( SToD( "19000101" ) ) ', IsLeap( SToD( "19000101" ) ), .F. )
   Check( 'IsLeap( SToD( "20000101" ) ) ', IsLeap( SToD( "20000101" ) ), .T. )
   Check( 'IsLeap()                     ', IsLeap(), IsLeap( Date() ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
