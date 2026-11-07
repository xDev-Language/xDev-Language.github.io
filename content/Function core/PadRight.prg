/*
 * $DOC$
 * $NAME$
 * PadRight()
 *
 * $ONELINER$
 * Pad a character string on the right
 *
 * $SYNTAX$
 * PadRight( cString, nLength, [xChar] ) --> cResult
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

   Check( 'PadRight( "123456", 4 )      ', PadRight( "123456", 4 ), "1234" )
   Check( 'PadRight( "123456", 8 )      ', PadRight( "123456", 8 ), "123456  " )
   Check( 'PadRight( "123456", 8, "." ) ', PadRight( "123456", 8, "." ), "123456.." )
   Check( 'PadRight( "123456", -1 )     ', PadRight( "123456", -1 ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
