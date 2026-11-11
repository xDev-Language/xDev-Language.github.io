/*
 * $DOC$
 * $NAME$
 * IsSpace()
 *
 * $ONELINER$
 * Check if the first character of a string is a white-space character
 *
 * $SYNTAX$
 * IsSpace( cString ) --> lIsWhiteSpaceChar
 *
 * $ARGUMENTS$
 * cString
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
 * Len( aSpace )           OK
 * IsSpace( Chr( 10 ) )    OK
 * IsSpace( "x" )          OK
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

   LOCAL aSpace := {}
   LOCAL i

   FOR i := 0 TO 255
      IF IsSpace( Chr( i ) )
         AAdd( aSpace, i )
      ENDIF
   NEXT

   Check( 'Len( aSpace )           ', Len( aSpace ), 6 )
   Check( 'IsSpace( Chr( 10 ) )    ', IsSpace( Chr( 10 ) ), .T. )
   Check( 'IsSpace( "x" )          ', IsSpace( "x" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
