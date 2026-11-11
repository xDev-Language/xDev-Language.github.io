/*
 * $DOC$
 * $NAME$
 * CharRela()
 *
 * $ONELINER$
 * Test if two substrings in two strings have the same position
 *
 * $SYNTAX$
 * CharRela( cSearch1, cString1, cSearch2, cString2 ) --> nPosition
 *
 * $ARGUMENTS$
 * cSearch1
 * cString1
 * cSearch2
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
 * CharRela( "b", "b b b b", "1", "bbb11111" ) OK
 * CharRela( "x", "abc", "y", "abc" )          OK
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

   Check( 'CharRela( "b", "b b b b", "1", "bbb11111" ) ', CharRela( "b", "b b b b", "1", "bbb11111" ), 5 )
   Check( 'CharRela( "x", "abc", "y", "abc" )          ', CharRela( "x", "abc", "y", "abc" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
