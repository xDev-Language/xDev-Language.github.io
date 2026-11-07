/*
 * $DOC$
 * $NAME$
 * RemAll()
 *
 * $ONELINER$
 * Delete a specified character from both sides of a string
 *
 * $SYNTAX$
 * RemAll( cString, [xChar] ) --> cResult
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

   Check( 'RemAll( "  xDev  " )           ', RemAll( "  xDev  " ), "xDev" )
   Check( 'RemAll( "***Total***", "*" )   ', RemAll( "***Total***", "*" ), "Total" )
   Check( 'RemAll( "--42--", Asc( "-" ) ) ', RemAll( "--42--", Asc( "-" ) ), "42" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
