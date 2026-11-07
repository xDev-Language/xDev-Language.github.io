/*
 * $DOC$
 * $NAME$
 * AtNum()
 *
 * $ONELINER$
 * Search multiple occurrences of a substring within a string
 *
 * $SYNTAX$
 * AtNum( cSearch, cString, [nCount], [nSkipChars] ) --> nPos
 *
 * $ARGUMENTS$
 * cSearch
 * cString
 * nCount
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

   LOCAL cPath := "C:\xDev\tests\AtNum.prg"

   Check( 'AtNum( "\", cPath )                      ', AtNum( "\", cPath ), 14 )
   Check( 'SubStr( cPath, AtNum( "\", cPath ) + 1 ) ', SubStr( cPath, AtNum( "\", cPath ) + 1 ), "AtNum.prg" )
   Check( 'AtNum( "bc", "abcdeabc", 1 )             ', AtNum( "bc", "abcdeabc", 1 ), 2 )
   Check( 'AtNum( "bc", "abcdeabc", 1, 3 )          ', AtNum( "bc", "abcdeabc", 1, 3 ), 7 )
   Check( 'AtNum( "aa", "aaa" )                     ', AtNum( "aa", "aaa" ), 1 )
   Check( 'AtNum( "/", cPath )                      ', AtNum( "/", cPath ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
