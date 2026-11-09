/*
 * $DOC$
 * $NAME$
 * PosLower()
 *
 * $ONELINER$
 * Return the position of the first lower case letter in a character string
 *
 * $SYNTAX$
 * PosLower( cString, [lNoLower], [nSkipChars] ) --> nPos
 *
 * $ARGUMENTS$
 * cString
 * lNoLower
 * nSkipChars
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
 * PosLower( cString )          OK
 * PosLower( cString, .T. )     OK
 * PosLower( cString, .F., 7 )  OK
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

   LOCAL cString := "123ABCuabc"

   Check( 'PosLower( cString )          ', PosLower( cString ), 7 )
   Check( 'PosLower( cString, .T. )     ', PosLower( cString, .T. ), 1 )
   Check( 'PosLower( cString, .F., 7 )  ', PosLower( cString, .F., 7 ), 8 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
