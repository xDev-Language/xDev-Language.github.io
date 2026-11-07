/*
 * $DOC$
 * $NAME$
 * CharSHR()
 *
 * $ONELINER$
 * Shift the bits of the characters in a string to the right
 *
 * $SYNTAX$
 * CharSHR( cString, nShift ) --> cResult
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

   LOCAL cShift := CharSHR( "AB", 2 )

   Check( 'Asc( cShift )              ', Asc( cShift ), 16 )
   Check( 'Asc( SubStr( cShift, 2 ) ) ', Asc( SubStr( cShift, 2 ) ), 16 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
