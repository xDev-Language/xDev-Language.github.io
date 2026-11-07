/*
 * $DOC$
 * $NAME$
 * ReplAll()
 *
 * $ONELINER$
 * Replace a specified character on both sides of a string
 *
 * $SYNTAX$
 * ReplAll( cString, xReplace, [xSearch] ) --> cResult
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

   Check( 'ReplAll( "  42  ", "*" )      ', ReplAll( "  42  ", "*" ), "**42**" )
   Check( 'ReplAll( "--42--", " ", "-" ) ', ReplAll( "--42--", " ", "-" ), "  42  " )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
