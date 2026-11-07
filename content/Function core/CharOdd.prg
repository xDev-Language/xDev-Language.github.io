/*
 * $DOC$
 * $NAME$
 * CharOdd()
 *
 * $ONELINER$
 * Extract the characters at odd positions from a string
 *
 * $SYNTAX$
 * CharOdd( cString ) --> cResult
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

   Check( 'CharOdd( "a1b2c3" ) ', CharOdd( "a1b2c3" ), "abc" )
   Check( 'CharOdd( "x" )      ', CharOdd( "x" ), "x" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
