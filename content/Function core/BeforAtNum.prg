/*
 * $DOC$
 * $NAME$
 * BeforAtNum()
 *
 * $ONELINER$
 * Extract the part of a string before the last occurrence of a search string
 *
 * $SYNTAX$
 * BeforAtNum( cSearch, cString, [nCount], [nSkipChars] ) --> cResult
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

   LOCAL cPath := "C:\xDev\tests\BeforAtNum.prg"

   Check( 'BeforAtNum( "\", cPath )                 ', BeforAtNum( "\", cPath ), "C:\xDev\tests" )
   Check( 'BeforAtNum( ".", "archive.tar.gz" )      ', BeforAtNum( ".", "archive.tar.gz" ), "archive.tar" )
   Check( 'BeforAtNum( ".", "archive.tar.gz", 1 )   ', BeforAtNum( ".", "archive.tar.gz", 1 ), "archive" )
   Check( 'BeforAtNum( "/", "archive.tar.gz" )      ', BeforAtNum( "/", "archive.tar.gz" ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
