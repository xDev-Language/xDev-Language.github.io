/*
 * $DOC$
 * $NAME$
 * CharMix()
 *
 * $ONELINER$
 * Merge the characters of two strings
 *
 * $SYNTAX$
 * CharMix( cString1, cString2 ) --> cResult
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
 * CharMix( "ABC", "123" )                       OK
 * CharMix( "ABCDE", "12" )                      OK
 * CharMix( "AB", "12345" )                      OK
 * CharMix( "HELLO", "" )                        OK
 * CharMix( CharOdd( "a1b2" ), CharEven( "a1b2" ) ) OK
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

   Check( 'CharMix( "ABC", "123" )                       ', CharMix( "ABC", "123" ), "A1B2C3" )
   Check( 'CharMix( "ABCDE", "12" )                      ', CharMix( "ABCDE", "12" ), "A1B2C1D2E1" )
   Check( 'CharMix( "AB", "12345" )                      ', CharMix( "AB", "12345" ), "A1B2" )
   Check( 'CharMix( "HELLO", "" )                        ', CharMix( "HELLO", "" ), "HELLO" )
   Check( 'CharMix( CharOdd( "a1b2" ), CharEven( "a1b2" ) ) ', CharMix( CharOdd( "a1b2" ), CharEven( "a1b2" ) ), "a1b2" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
