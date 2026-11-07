/*
 * $DOC$
 * $NAME$
 * CharXOR()
 *
 * $ONELINER$
 * Combine the characters of two strings with a binary XOR
 *
 * $SYNTAX$
 * CharXOR( cString1, cString2 ) --> cResult
 *
 * $ARGUMENTS$
 * cString1
 * cString2
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

   LOCAL cKey    := "xDev"
   LOCAL cSecret := CharXOR( "Meet at noon", cKey )

   Check( 'CharXOR( cSecret, cKey )               ', CharXOR( cSecret, cKey ), "Meet at noon" )
   Check( 'cSecret == "Meet at noon"              ', cSecret == "Meet at noon", .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
