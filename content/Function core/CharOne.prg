/*
 * $DOC$
 * $NAME$
 * CharOne()
 *
 * $ONELINER$
 * Remove duplicate adjacent characters from a string
 *
 * $SYNTAX$
 * CharOne( [cDelete], cString ) --> cResult
 *
 * $ARGUMENTS$
 * cDelete
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

   Check( 'CharOne( "a  b   c" )             ', CharOne( "a  b   c" ), "a b c" )
   Check( 'CharOne( "bookkeeper" )           ', CharOne( "bookkeeper" ), "bokeper" )
   Check( 'CharOne( " ", "Hello   world!!" ) ', CharOne( " ", "Hello   world!!" ), "Hello world!!" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
