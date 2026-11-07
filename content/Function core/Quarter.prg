/*
 * $DOC$
 * $NAME$
 * Quarter()
 *
 * $ONELINER$
 * Return the quarter a date belongs to
 *
 * $SYNTAX$
 * Quarter( [dDate] ) --> nQuarter
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

   Check( 'Quarter( SToD( "20260331" ) ) ', Quarter( SToD( "20260331" ) ), 1 )
   Check( 'Quarter( SToD( "20261102" ) ) ', Quarter( SToD( "20261102" ) ), 4 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
