/*
 * $DOC$
 * $NAME$
 * CountLeft()
 *
 * $ONELINER$
 * Count a specified character on the left side of a string
 *
 * $SYNTAX$
 * CountLeft( cString, [xChar] ) --> nCount
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

   Check( 'CountLeft( "   Indented" )    ', CountLeft( "   Indented" ), 3 )
   Check( 'CountLeft( "000123", "0" )    ', CountLeft( "000123", "0" ), 3 )
   Check( 'CountLeft( "xDev" )           ', CountLeft( "xDev" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
