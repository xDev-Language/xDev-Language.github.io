/*
 * $DOC$
 * $NAME$
 * CharRelRep()
 *
 * $ONELINER$
 * Replace characters if two substrings in two strings have the same position
 *
 * $SYNTAX$
 * CharRelRep( cSearch1, cString1, cSearch2, cString2, cReplace ) --> cResult
 *
 * $ARGUMENTS$
 * cSearch1
 * cString1
 * cSearch2
 * cString2
 * cReplace
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
 * CharRelRep( "b", "b b b b", "1", "bbb11111", "x" ) OK
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

   Check( 'CharRelRep( "b", "b b b b", "1", "bbb11111", "x" ) ', CharRelRep( "b", "b b b b", "1", "bbb11111", "x" ), "bbb1x1x1" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
