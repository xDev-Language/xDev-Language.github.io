/*
 * $DOC$
 * $NAME$
 * TabPack()
 *
 * $ONELINER$
 * Insert a Tab (Chr(9)) for multiple occurrances of a character
 *
 * $SYNTAX$
 * TabPack( cString, [nTabWidth], [xFillChar] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * nTabWidth
 * xFillChar
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
 * TabPack( "AAAAAAA*", "*" )    OK
 * TabPack( "AAAAA***", "*" )    OK
 * TabPack( "AAAAA*****", "*" )  OK
 * TabPack( cText, 4, "+" )      OK
 * TabPack( cLine )              OK
 * TabExpand( TabPack( cLine ) ) OK
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

   LOCAL cText := "ABCD+" + Chr( 13 ) + Chr( 10 ) + "++---+++++"
   LOCAL cLine := "Name    City"

   Check( 'TabPack( "AAAAAAA*", "*" )    ', TabPack( "AAAAAAA*", "*" ), "AAAAAAA*" )
   Check( 'TabPack( "AAAAA***", "*" )    ', TabPack( "AAAAA***", "*" ), "AAAAA" + Chr( 9 ) )
   Check( 'TabPack( "AAAAA*****", "*" )  ', TabPack( "AAAAA*****", "*" ), "AAAAA" + Chr( 9 ) + "**" )
   Check( 'TabPack( cText, 4, "+" )      ', TabPack( cText, 4, "+" ), "ABCD+" + Chr( 13 ) + Chr( 10 ) + "++---" + Chr( 9 ) + "++" )
   Check( 'TabPack( cLine )              ', TabPack( cLine ), "Name" + Chr( 9 ) + "City" )
   Check( 'TabExpand( TabPack( cLine ) ) ', TabExpand( TabPack( cLine ) ), cLine )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
