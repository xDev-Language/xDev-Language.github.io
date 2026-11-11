/*
 * $DOC$
 * $NAME$
 * StrDiff()
 *
 * $ONELINER$
 * Calculate the similarity of two strings
 *
 * $SYNTAX$
 * StrDiff( cString1, cString2, [nReplace], [nDelete], [nInsert] ) --> nSimilarity
 *
 * $ARGUMENTS$
 * cString1
 * cString2
 * nReplace
 * nDelete
 * nInsert
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
 * StrDiff( "ABC", "ABC" )  OK
 * StrDiff( "ABC", "ADC" )  OK
 * StrDiff( "CBA", "ABC" )  OK
 * StrDiff( "ABC", "AXBC" ) OK
 * StrDiff( "AXBC", "ABC" ) OK
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

   Check( 'StrDiff( "ABC", "ABC" )  ', StrDiff( "ABC", "ABC" ), 0 )
   Check( 'StrDiff( "ABC", "ADC" )  ', StrDiff( "ABC", "ADC" ), 3 )
   Check( 'StrDiff( "CBA", "ABC" )  ', StrDiff( "CBA", "ABC" ), 6 )
   Check( 'StrDiff( "ABC", "AXBC" ) ', StrDiff( "ABC", "AXBC" ), 1 )
   Check( 'StrDiff( "AXBC", "ABC" ) ', StrDiff( "AXBC", "ABC" ), 6 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
