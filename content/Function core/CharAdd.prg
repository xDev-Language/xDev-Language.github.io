/*
 * $DOC$
 * $NAME$
 * CharAdd()
 *
 * $ONELINER$
 * Create a string from the sum of ASCII codes of two strings
 *
 * $SYNTAX$
 * CharAdd( cString1, cString2 ) --> cResult
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
 * CharAdd( "01234", Chr( 1 ) )   OK
 * CharAdd( "12345", Chr( 255 ) ) OK
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

   Check( 'CharAdd( "01234", Chr( 1 ) )   ', CharAdd( "01234", Chr( 1 ) ), "12345" )
   Check( 'CharAdd( "12345", Chr( 255 ) ) ', CharAdd( "12345", Chr( 255 ) ), "01234" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
