/*
 * $DOC$
 * $NAME$
 * PosDiff()
 *
 * $ONELINER$
 * Search the first position where two character strings differ
 *
 * $SYNTAX$
 * PosDiff( cString1, cString2, [nSkipChars] ) --> nPos
 *
 * $ARGUMENTS$
 * cString1
 * cString2
 * nSkipChars
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

   LOCAL cString1 := "X23AB$/A"
   LOCAL cString2 := "X23A8$/A"

   Check( 'PosDiff( cString1, cString2 ) ', PosDiff( cString1, cString2 ), 5 )
   Check( 'PosDiff( "AB", "ABC" )        ', PosDiff( "AB", "ABC" ), 3 )
   Check( 'PosDiff( "AB", "AB" )         ', PosDiff( "AB", "AB" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
