/*
 * $DOC$
 * $NAME$
 * CharNOT()
 *
 * $ONELINER$
 * Invert the bits of the characters in a string with a binary NOT
 *
 * $SYNTAX$
 * CharNOT( cString ) --> cResult
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
 * CharNOT( CharNOT( "123ABCabc" ) ) OK
 * Asc( CharNOT( Chr( 0 ) ) )        OK
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

   Check( 'CharNOT( CharNOT( "123ABCabc" ) ) ', CharNOT( CharNOT( "123ABCabc" ) ), "123ABCabc" )
   Check( 'Asc( CharNOT( Chr( 0 ) ) )        ', Asc( CharNOT( Chr( 0 ) ) ), 255 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
