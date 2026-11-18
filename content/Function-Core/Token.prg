/*
 * $DOC$
 * $NAME$
 * Token()
 *
 * $ONELINER$
 * Retrieve the n-th token from a string
 *
 * $SYNTAX$
 * Token( cString, [cDelimiter], [nTokenPos], [nSkipWidth], [@cPreTokenSep], [@cPostTokenSep] ) --> cToken
 *
 * $ARGUMENTS$
 * cString
 * cDelimiter
 * nTokenPos
 * nSkipWidth
 * cPreTokenSep
 * cPostTokenSep
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
 * Token( "xBase" )                                    OK
 * Token( " ,   xBase . " )                            OK
 * Token( "xBase COMPILER!" )                          OK
 * Token( "xBase COMPILER!", 1 )                       OK
 * Token( "This is a test.", 3 )                       OK
 * Token( "This is a test.", 5 )                       OK
 * Token( cString, ",", 3, 1 )                         OK
 * Token( cString, ",", 4, 1 )                         OK
 * Token( "32+45*70", "+/-*", 2, , @cBefore, @cAfter ) OK
 * cBefore                                             OK
 * cAfter                                              OK
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

   LOCAL cString := "one,two,,four"
   LOCAL cBefore := ""
   LOCAL cAfter  := ""

   Check( 'Token( "xBase" )                                    ', Token( "xBase" ), "xBase" )
   Check( 'Token( " ,   xBase . " )                            ', Token( " ,   xBase . " ), "xBase" )
   Check( 'Token( "xBase COMPILER!" )                          ', Token( "xBase COMPILER!" ), "COMPILER" )
   Check( 'Token( "xBase COMPILER!", 1 )                       ', Token( "xBase COMPILER!", 1 ), "xBase" )
   Check( 'Token( "This is a test.", 3 )                       ', Token( "This is a test.", 3 ), "a" )
   Check( 'Token( "This is a test.", 5 )                       ', Token( "This is a test.", 5 ), "" )
   Check( 'Token( cString, ",", 3, 1 )                         ', Token( cString, ",", 3, 1 ), "" )
   Check( 'Token( cString, ",", 4, 1 )                         ', Token( cString, ",", 4, 1 ), "four" )
   Check( 'Token( "32+45*70", "+/-*", 2, , @cBefore, @cAfter ) ', Token( "32+45*70", "+/-*", 2, , @cBefore, @cAfter ), "45" )
   Check( 'cBefore                                             ', cBefore, "+" )
   Check( 'cAfter                                              ', cAfter, "*" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
