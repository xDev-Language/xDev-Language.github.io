/*
 * $DOC$
 * $NAME$
 * ReplRight()
 *
 * $ONELINER$
 * Replace a specified character on the right side of a string
 *
 * $SYNTAX$
 * ReplRight( cString, xReplace, [xSearch] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * xReplace
 * xSearch
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

   Check( 'ReplRight( PadR( "Total", 10 ), "." ) + "42" ', ReplRight( PadR( "Total", 10 ), "." ) + "42", "Total.....42" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
