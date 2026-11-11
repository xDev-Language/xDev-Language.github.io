/*
 * $DOC$
 * $NAME$
 * CountRight()
 *
 * $ONELINER$
 * Count a specified character on the right side of a string
 *
 * $SYNTAX$
 * CountRight( cString, [xChar] ) --> nCount
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
 * CountRight( "1.500", "0" ) OK
 * CountRight( "xDev  " )     OK
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

   Check( 'CountRight( "1.500", "0" ) ', CountRight( "1.500", "0" ), 2 )
   Check( 'CountRight( "xDev  " )     ', CountRight( "xDev  " ), 2 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
