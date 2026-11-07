/*
 * $DOC$
 * $NAME$
 * PosRepl()
 *
 * $ONELINER$
 * Replace characters in a string beginning at a specified position
 *
 * $SYNTAX$
 * PosRepl( cString, cReplace, [nPos] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * cReplace
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

   Check( 'PosRepl( "ABCDEFG", "XXX", 3 ) ', PosRepl( "ABCDEFG", "XXX", 3 ), "ABXXXFG" )
   Check( 'PosRepl( "ABCDEFG", "XXX" )    ', PosRepl( "ABCDEFG", "XXX" ), "ABCDXXX" )
   Check( 'PosRepl( "ABCDEF", "123", 5 )  ', PosRepl( "ABCDEF", "123", 5 ), "ABCD123" )
   Check( 'PosRepl( "ABCDEF", "123", 6 )  ', PosRepl( "ABCDEF", "123", 6 ), "ABCDE123" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
