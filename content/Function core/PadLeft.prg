/*
 * $DOC$
 * $NAME$
 * PadLeft()
 *
 * $ONELINER$
 * Pad a character string on the left
 *
 * $SYNTAX$
 * PadLeft( cString, nLength, [xChar] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * nLength
 * xChar
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
 * PadLeft( "123456", 4 )      OK
 * PadLeft( "123456", 8 )      OK
 * PadLeft( "123456", 8, "." ) OK
 * PadLeft( "7", 3, 48 )       OK
 * PadLeft( "123456", -1 )     OK
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

   Check( 'PadLeft( "123456", 4 )      ', PadLeft( "123456", 4 ), "3456" )
   Check( 'PadLeft( "123456", 8 )      ', PadLeft( "123456", 8 ), "  123456" )
   Check( 'PadLeft( "123456", 8, "." ) ', PadLeft( "123456", 8, "." ), "..123456" )
   Check( 'PadLeft( "7", 3, 48 )       ', PadLeft( "7", 3, 48 ), "007" )
   Check( 'PadLeft( "123456", -1 )     ', PadLeft( "123456", -1 ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
