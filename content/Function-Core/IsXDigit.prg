/*
 * $DOC$
 * $NAME$
 * IsXDigit()
 *
 * $ONELINER$
 * Check if the first character of a string is a hexadecimal digit
 *
 * $SYNTAX$
 * IsXDigit( cString ) --> lIsHexDigit
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
 * cHex                OK
 * IsXDigit( "g" )     OK
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

   LOCAL cHex := ""
   LOCAL i

   FOR i := 0 TO 255
      IF IsXDigit( Chr( i ) )
         cHex += Chr( i )
      ENDIF
   NEXT

   Check( 'cHex                ', cHex, "0123456789ABCDEFabcdef" )
   Check( 'IsXDigit( "g" )     ', IsXDigit( "g" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
