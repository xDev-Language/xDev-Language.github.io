/*
 * $DOC$
 * $NAME$
 * NToCDoW()
 *
 * $ONELINER$
 * Convert a numeric week day to its name
 *
 * $SYNTAX$
 * NToCDoW( nDayOfWeek ) --> cDayName
 *
 * $ARGUMENTS$
 * nDayOfWeek
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
 * NToCDoW( 1 ) OK
 * NToCDoW( 2 ) OK
 * NToCDoW( 8 ) OK
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

   Check( 'NToCDoW( 1 ) ', NToCDoW( 1 ), "Sunday" )
   Check( 'NToCDoW( 2 ) ', NToCDoW( 2 ), "Monday" )
   Check( 'NToCDoW( 8 ) ', NToCDoW( 8 ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
