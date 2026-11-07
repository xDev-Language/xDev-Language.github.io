/*
 * $DOC$
 * $NAME$
 * CharSpread()
 *
 * $ONELINER$
 * Format a character string for block paragraphs
 *
 * $SYNTAX$
 * CharSpread( cString, nLineLen, [xInsChar] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * nLineLen
 * xInsChar
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

   Check( 'CharSpread( "123456", 20, "." )          ', CharSpread( "123456", 20, "." ), "123456" )
   Check( 'CharSpread( "1.2.3.4.5.6", 20, 46 )      ', CharSpread( "1.2.3.4.5.6", 20, 46 ), "1...2...3..4...5...6" )
   Check( 'CharSpread( "11.22........33", 20, "." ) ', CharSpread( "11.22........33", 20, "." ), "11....22..........33" )
   Check( 'CharSpread( "Ala ma kota", 15 )          ', CharSpread( "Ala ma kota", 15 ), "Ala   ma   kota" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
