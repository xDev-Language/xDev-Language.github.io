/*
 * $DOC$
 * $NAME$
 * CharMirr()
 *
 * $ONELINER$
 * Reverse the order of the characters in a string
 *
 * $SYNTAX$
 * CharMirr( cString, [lNoSpaces] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * lNoSpaces
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
 * CharMirr( "xDev" )         OK
 * CharMirr( "abc  " )        OK
 * CharMirr( "abc  ", .T. )   OK
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

   Check( 'CharMirr( "xDev" )         ', CharMirr( "xDev" ), "veDx" )
   Check( 'CharMirr( "abc  " )        ', CharMirr( "abc  " ), "  cba" )
   Check( 'CharMirr( "abc  ", .T. )   ', CharMirr( "abc  ", .T. ), "cba  " )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
