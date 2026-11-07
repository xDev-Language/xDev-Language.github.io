/*
 * $DOC$
 * $NAME$
 * CharRLR()
 *
 * $ONELINER$
 * Rotate the bits of the characters in a string to the right
 *
 * $SYNTAX$
 * CharRLR( cString, nShift ) --> cResult
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

   LOCAL cShift := CharRLR( "AB", 2 )

   Check( 'Asc( cShift )              ', Asc( cShift ), 80 )
   Check( 'Asc( SubStr( cShift, 2 ) ) ', Asc( SubStr( cShift, 2 ) ), 144 )
   Check( 'CharRLR( "AB", 8 )         ', CharRLR( "AB", 8 ), "AB" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
