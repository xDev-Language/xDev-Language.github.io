/*
 * $DOC$
 * $NAME$
 * CharRepl()
 *
 * $ONELINER$
 * Replace a list of characters with a corresponding list
 *
 * $SYNTAX$
 * CharRepl( cSearch, cString, cReplace, [lOnePass] ) --> cResult
 *
 * $ARGUMENTS$
 * cSearch
 * cString
 * cReplace
 * lOnePass
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
 * CharRepl( "-", "2026-11-02", "." )   OK
 * CharRepl( "abc", "aabbcc", "xyz" )   OK
 * CharRepl( "abc", "aabbcc", "x" )     OK
 * CharRepl( "ab", "ab", "bc" )         OK
 * CharRepl( "ab", "ab", "bc", .T. )    OK
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

   Check( 'CharRepl( "-", "2026-11-02", "." )   ', CharRepl( "-", "2026-11-02", "." ), "2026.11.02" )
   Check( 'CharRepl( "abc", "aabbcc", "xyz" )   ', CharRepl( "abc", "aabbcc", "xyz" ), "xxyyzz" )
   Check( 'CharRepl( "abc", "aabbcc", "x" )     ', CharRepl( "abc", "aabbcc", "x" ), "xxxxxx" )
   Check( 'CharRepl( "ab", "ab", "bc" )         ', CharRepl( "ab", "ab", "bc" ), "cc" )
   Check( 'CharRepl( "ab", "ab", "bc", .T. )    ', CharRepl( "ab", "ab", "bc", .T. ), "bc" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
