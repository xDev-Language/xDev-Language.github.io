/*
 * $DOC$
 * $NAME$
 * PosChar()
 *
 * $ONELINER$
 * Replace a single character at a specified position in a string
 *
 * $SYNTAX$
 * PosChar( cString, xChar, [nPos] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * xChar
 * nPos
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
 * PosChar( "ABCDEF", "X", 3 ) OK
 * PosChar( "ABCDEF", "X" )    OK
 * PosChar( @cVar, "X" )       OK
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

   LOCAL cVar := "ABCDEF"

   Check( 'PosChar( "ABCDEF", "X", 3 ) ', PosChar( "ABCDEF", "X", 3 ), "ABXDEF" )
   Check( 'PosChar( "ABCDEF", "X" )    ', PosChar( "ABCDEF", "X" ), "ABCDEX" )

   PosChar( @cVar, "X" )
   Check( 'PosChar( @cVar, "X" )       ', cVar, "ABCDEX" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
