/*
 * $DOC$
 * $NAME$
 * CharAND()
 *
 * $ONELINER$
 * Combine the characters of two strings with a binary AND
 *
 * $SYNTAX$
 * CharAND( cString1, cString2 ) --> cResult
 *
 * $ARGUMENTS$
 * cString1
 * cString2
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

   Check( 'CharAND( "123abc   ", "123" ) ', CharAND( "123abc   ", "123" ), '123!"#   ' )
   Check( 'CharAND( "xdev", Chr( 223 ) ) ', CharAND( "xdev", Chr( 223 ) ), "XDEV" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
