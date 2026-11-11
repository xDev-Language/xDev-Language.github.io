/*
 * $DOC$
 * $NAME$
 * RemRight()
 *
 * $ONELINER$
 * Delete a specified character from the right side of a string
 *
 * $SYNTAX$
 * RemRight( cString, [xChar] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
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
 * RemRight( "12.500", "0" ) OK
 * RemRight( "xDev   " )     OK
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

   Check( 'RemRight( "12.500", "0" ) ', RemRight( "12.500", "0" ), "12.5" )
   Check( 'RemRight( "xDev   " )     ', RemRight( "xDev   " ), "xDev" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
