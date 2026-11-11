/*
 * $DOC$
 * $NAME$
 * TokenSep()
 *
 * $ONELINER$
 * Retrieve the separating characters of a token
 *
 * $SYNTAX$
 * TokenSep( [lRightSeparator] ) --> cSeparator
 *
 * $ARGUMENTS$
 * lRightSeparator
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
 * cLast                          OK
 * TokenSep()                     OK
 * TokenSep( .T. )                OK
 * Token( "32+45*70", "+/-*", 2 ) OK
 * TokenSep()                     OK
 * TokenSep( .T. )                OK
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

   LOCAL cLast := Token( "Hello, World!" )

   Check( 'cLast                          ', cLast, "World" )
   Check( 'TokenSep()                     ', TokenSep(), "," )
   Check( 'TokenSep( .T. )                ', TokenSep( .T. ), "!" )
   Check( 'Token( "32+45*70", "+/-*", 2 ) ', Token( "32+45*70", "+/-*", 2 ), "45" )
   Check( 'TokenSep()                     ', TokenSep(), "+" )
   Check( 'TokenSep( .T. )                ', TokenSep( .T. ), "*" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
