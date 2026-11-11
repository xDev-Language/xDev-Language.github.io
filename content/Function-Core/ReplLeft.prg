/*
 * $DOC$
 * $NAME$
 * ReplLeft()
 *
 * $ONELINER$
 * Replace a specified character on the left side of a string
 *
 * $SYNTAX$
 * ReplLeft( cString, xReplace, [xSearch] ) --> cResult
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
 * ReplLeft( Str( nInvoice, 6 ), "0" ) OK
 * ReplLeft( "xDev", "0" )             OK
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

   LOCAL nInvoice := 42

   Check( 'ReplLeft( Str( nInvoice, 6 ), "0" ) ', ReplLeft( Str( nInvoice, 6 ), "0" ), "000042" )
   Check( 'ReplLeft( "xDev", "0" )             ', ReplLeft( "xDev", "0" ), "xDev" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
