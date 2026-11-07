/*
 * $DOC$
 * $NAME$
 * CharUnpack()
 *
 * $ONELINER$
 * Uncompress a string compressed with CharPack()
 *
 * $SYNTAX$
 * CharUnpack( cCompressed ) --> cUncompressed
 *
 * $ARGUMENTS$
 * cCompressed
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

   LOCAL cText := "Hello" + Space( 50 ) + "World"

   Check( 'CharUnpack( CharPack( cText ) )    ', CharUnpack( CharPack( cText ) ), cText )
   Check( 'CharUnpack( CharPack( "abcabc" ) ) ', CharUnpack( CharPack( "abcabc" ) ), "abcabc" )
   Check( 'CharUnpack( "not packed" )         ', CharUnpack( "not packed" ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
