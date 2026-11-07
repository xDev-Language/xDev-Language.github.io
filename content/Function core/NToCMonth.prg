/*
 * $DOC$
 * $NAME$
 * NToCMonth()
 *
 * $ONELINER$
 * Convert a numeric month to its name
 *
 * $SYNTAX$
 * NToCMonth( nMonth ) --> cMonthName
 *
 * $ARGUMENTS$
 * nMonth
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

   Check( 'NToCMonth( 11 ) ', NToCMonth( 11 ), "November" )
   Check( 'NToCMonth( 13 ) ', NToCMonth( 13 ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
