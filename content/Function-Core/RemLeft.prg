/*
 * $DOC$
 * $NAME$
 * RemLeft()
 *
 * $ONELINER$
 * Delete a specified character from the left side of a string
 *
 * $SYNTAX$
 * RemLeft( cString, [xChar] ) --> cResult
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
 * RemLeft( "000123", "0" ) OK
 * RemLeft( "   xDev" )     OK
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

   Check( 'RemLeft( "000123", "0" ) ', RemLeft( "000123", "0" ), "123" )
   Check( 'RemLeft( "   xDev" )     ', RemLeft( "   xDev" ), "xDev" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
