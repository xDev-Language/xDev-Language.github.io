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
 * Token( "Clipper" )                                  OK
 * Token( " ,   Clipper . " )                          OK
 * Token( "Clipper COMPILER!" )                        OK
 * Token( "Clipper COMPILER!", 1 )                     OK
 * Token( "This is a test.", 3 )                       OK
 * Token( "This is a test.", 5 )                       OK
 * Token( cString, ",", 3, 1 )                         OK
 * Token( cString, ",", 4, 1 )                         OK
 * Token( "32+45*70", "+-*/", 2, , @cBefore, @cAfter ) OK
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

   Check( 'Token( "Clipper" )                                  ', Token( "Clipper" ), "Clipper" )
   Check( 'Token( " ,   Clipper . " )                          ', Token( " ,   Clipper . " ), "Clipper" )
   Check( 'Token( "Clipper COMPILER!" )                        ', Token( "Clipper COMPILER!" ), "COMPILER" )
   Check( 'Token( "Clipper COMPILER!", 1 )                     ', Token( "Clipper COMPILER!", 1 ), "Clipper" )
   Check( 'Token( "This is a test.", 3 )                       ', Token( "This is a test.", 3 ), "a" )
   Check( 'Token( "This is a test.", 5 )                       ', Token( "This is a test.", 5 ), "" )
   Check( 'Token( cString, ",", 3, 1 )                         ', Token( cString, ",", 3, 1 ), "" )
   Check( 'Token( cString, ",", 4, 1 )                         ', Token( cString, ",", 4, 1 ), "four" )
   Check( 'Token( "32+45*70", "+-*/", 2, , @cBefore, @cAfter ) ', Token( "32+45*70", "+-*/", 2, , @cBefore, @cAfter ), "45" )
   Check( 'cBefore                                             ', cBefore, "+" )
   Check( 'cAfter                                              ', cAfter, "*" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
