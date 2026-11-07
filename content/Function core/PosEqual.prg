/*
 * $DOC$
 * $NAME$
 * PosEqual()
 *
 * $ONELINER$
 * Search the first position where two character strings are equal
 *
 * $SYNTAX$
 * PosEqual( cString1, cString2, [nCompare], [nSkipChars] ) --> nPos
 *
 * $ARGUMENTS$
 * cString1
 * cString2
 * nCompare
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

   LOCAL cString1 := "ABCDEFGHI"
   LOCAL cString2 := "XYZDEKLMN"

   Check( 'PosEqual( cString1, cString2 )       ', PosEqual( cString1, cString2 ), 0 )
   Check( 'PosEqual( cString1, cString2, 2 )    ', PosEqual( cString1, cString2, 2 ), 4 )
   Check( 'PosEqual( cString1, cString2, 1, 4 ) ', PosEqual( cString1, cString2, 1, 4 ), 5 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
