/*
 * $DOC$
 * $NAME$
 * AfterAtNum()
 *
 * $ONELINER$
 * Return the portion of a string after the nth occurrence of a substring
 *
 * $SYNTAX$
 * AfterAtNum( cSearch, cString, [nOccurrence], [nIgnore] ) --> cRest
 *
 * $ARGUMENTS$
 * cSearch
 * cString
 * nOccurrence
 * nIgnore
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
 * AfterAtNum( ".", "archive.tar.gz" )    OK
 * AfterAtNum( ".", "archive.tar.gz", 1 ) OK
 * AfterAtNum( "@", "anna@example.com" )  OK
 * AfterAtNum( "/", "archive.tar.gz" )    OK
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

   Check( 'AfterAtNum( ".", "archive.tar.gz" )    ', AfterAtNum( ".", "archive.tar.gz" ), "gz" )
   Check( 'AfterAtNum( ".", "archive.tar.gz", 1 ) ', AfterAtNum( ".", "archive.tar.gz", 1 ), "tar.gz" )
   Check( 'AfterAtNum( "@", "anna@example.com" )  ', AfterAtNum( "@", "anna@example.com" ), "example.com" )
   Check( 'AfterAtNum( "/", "archive.tar.gz" )    ', AfterAtNum( "/", "archive.tar.gz" ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
