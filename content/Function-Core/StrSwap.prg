/*
 * $DOC$
 * $NAME$
 * StrSwap()
 *
 * $ONELINER$
 * Exchange characters between two strings
 *
 * $SYNTAX$
 * StrSwap( [@]cString1, [@]cString2 ) --> cNull
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
 * StrSwap( @cStr1, @cStr2 ) OK
 * cStr1                     OK
 * cStr2                     OK
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

   LOCAL cStr1 := "1234567890"
   LOCAL cStr2 := "ABCDEFGHIJKLM"

   Check( 'StrSwap( @cStr1, @cStr2 ) ', StrSwap( @cStr1, @cStr2 ), "" )
   Check( 'cStr1                     ', cStr1, "ABCDEFGHIJ" )
   Check( 'cStr2                     ', cStr2, "1234567890KLM" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
