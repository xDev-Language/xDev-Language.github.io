/*
 * $DOC$
 * $NAME$
 * CharSHL()
 *
 * $ONELINER$
 * Shift the bits of the characters in a string to the left
 *
 * $SYNTAX$
 * CharSHL( cString, nShift ) --> cResult
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
 * Asc( cShift )                 OK
 * Asc( SubStr( cShift, 2 ) )    OK
 * CharSHL( "AB", 8 )            OK
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

   LOCAL cShift := CharSHL( "AB", 2 )

   Check( 'Asc( cShift )                 ', Asc( cShift ), 4 )
   Check( 'Asc( SubStr( cShift, 2 ) )    ', Asc( SubStr( cShift, 2 ) ), 8 )
   Check( 'CharSHL( "AB", 8 )            ', CharSHL( "AB", 8 ), Chr( 0 ) + Chr( 0 ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
