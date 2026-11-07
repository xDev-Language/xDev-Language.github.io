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
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

#include "std.ch"

PROCEDURE Main()

   Check( 'MDY( SToD( "20261102" ) ) ', MDY( SToD( "20261102" ) ), "November 2, 26" )

   SET CENTURY ON

   Check( 'MDY( SToD( "20261102" ) ) ', MDY( SToD( "20261102" ) ), "November 2, 2026" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
