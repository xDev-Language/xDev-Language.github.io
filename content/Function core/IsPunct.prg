/*
 * $DOC$
 * $NAME$
 * IsPunct()
 *
 * $ONELINER$
 * Check if the first character of a string is a punctuation character
 *
 * $SYNTAX$
 * IsPunct( cString ) --> lIsPunctuationChar
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

   LOCAL cPunct := ""
   LOCAL i

   FOR i := 32 TO 126
      IF IsPunct( Chr( i ) )
         cPunct += Chr( i )
      ENDIF
   NEXT

   Check( 'Len( cPunct )   ', Len( cPunct ), 32 )
   Check( 'IsPunct( "," )  ', IsPunct( "," ), .T. )
   Check( 'IsPunct( "a" )  ', IsPunct( "a" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
