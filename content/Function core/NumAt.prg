/*
 * $DOC$
 * $NAME$
 * NumAt()
 *
 * $ONELINER$
 * Count multiple occurrences of a substring within a string
 *
 * $SYNTAX$
 * NumAt( cSearch, cString, [nSkipChars] ) --> nCount
 *
 * $ARGUMENTS$
 * cSearch
 * cString
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
 * NumAt( ";", cLine ) + 1        OK
 * NumAt( "an", "banana" )        OK
 * NumAt( "aa", "aaaa" )          OK
 * NumAt( "an", "banana", 3 )     OK
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

   LOCAL cLine := "Anna;Kowalska;Kraków;30-001"

   Check( 'NumAt( ";", cLine ) + 1        ', NumAt( ";", cLine ) + 1, 4 )
   Check( 'NumAt( "an", "banana" )        ', NumAt( "an", "banana" ), 2 )
   Check( 'NumAt( "aa", "aaaa" )          ', NumAt( "aa", "aaaa" ), 2 )
   Check( 'NumAt( "an", "banana", 3 )     ', NumAt( "an", "banana", 3 ), 1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
