/*
 * $DOC$
 * $NAME$
 * CharRLL()
 *
 * $ONELINER$
 * Rotate the bits of the characters in a string to the left
 *
 * $SYNTAX$
 * CharRLL( cString, nShift ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * nShift
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
 * Asc( cShift )                    OK
 * Asc( SubStr( cShift, 2 ) )       OK
 * CharRLR( CharRLL( "xDev", 3 ), 3 ) OK
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

   LOCAL cShift := CharRLL( "AB", 2 )

   Check( 'Asc( cShift )                    ', Asc( cShift ), 5 )
   Check( 'Asc( SubStr( cShift, 2 ) )       ', Asc( SubStr( cShift, 2 ) ), 9 )
   Check( 'CharRLR( CharRLL( "xDev", 3 ), 3 ) ', CharRLR( CharRLL( "xDev", 3 ), 3 ), "xDev" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
