/*
 * $DOC$
 * $NAME$
 * PosAlpha()
 *
 * $ONELINER$
 * Return the position of the first alphabetic characters in a character string
 *
 * $SYNTAX$
 * PosAlpha( cString, [lNoAlpha], [nSkipChars] ) --> nPos
 *
 * $ARGUMENTS$
 * cString
 * lNoAlpha
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

   LOCAL cString := "UKLM123"

   Check( 'PosAlpha( cString )          ', PosAlpha( cString ), 1 )
   Check( 'PosAlpha( cString, .T. )     ', PosAlpha( cString, .T. ), 5 )
   Check( 'PosAlpha( cString, .F., 2 )  ', PosAlpha( cString, .F., 2 ), 3 )
   Check( 'PosAlpha( "2026" )           ', PosAlpha( "2026" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
