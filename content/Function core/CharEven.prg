/*
 * $DOC$
 * $NAME$
 * CharEven()
 *
 * $ONELINER$
 * Extract the characters at even positions from a string
 *
 * $SYNTAX$
 * CharEven( cString ) --> cResult
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
 * CharEven( "a1b2c3" ) OK
 * CharEven( "x" )      OK
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

   Check( 'CharEven( "a1b2c3" ) ', CharEven( "a1b2c3" ), "123" )
   Check( 'CharEven( "x" )      ', CharEven( "x" ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
