/*
 * $DOC$
 * $NAME$
 * CharSwap()
 *
 * $ONELINER$
 * Exchange adjacent characters in a string
 *
 * $SYNTAX$
 * CharSwap( cString ) --> cResult
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
 * CharSwap( "badc" ) OK
 * CharSwap( "abc" )  OK
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

   Check( 'CharSwap( "badc" ) ', CharSwap( "badc" ), "abcd" )
   Check( 'CharSwap( "abc" )  ', CharSwap( "abc" ), "bac" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
