/*
 * $DOC$
 * $NAME$
 * CharSub()
 *
 * $ONELINER$
 * Create a string by subtracting the ASCII codes of two strings
 *
 * $SYNTAX$
 * CharSub( cString1, cString2 ) --> cResult
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
 * CharSub( cString, Chr( 9 ) )                OK
 * CharSub( cString, Space( 3 ) )              OK
 * CharSub( CharAdd( cString, "key" ), "key" ) OK
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

   LOCAL cString := "abc"

   Check( 'CharSub( cString, Chr( 9 ) )                ', CharSub( cString, Chr( 9 ) ), "XYZ" )
   Check( 'CharSub( cString, Space( 3 ) )              ', CharSub( cString, Space( 3 ) ), "ABC" )
   Check( 'CharSub( CharAdd( cString, "key" ), "key" ) ', CharSub( CharAdd( cString, "key" ), "key" ), cString )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
