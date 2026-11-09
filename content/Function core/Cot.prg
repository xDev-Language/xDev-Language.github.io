/*
 * $DOC$
 * $NAME$
 * Cot()
 *
 * $ONELINER$
 * Calculate the cotangent
 *
 * $SYNTAX$
 * Cot( nAngle ) --> nCotangent
 *
 * $ARGUMENTS$
 * nAngle
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
 * Round( Cot( Pi() / 4 ), 6 ) OK
 * Round( Cot( Pi() / 2 ), 6 ) OK
 * Round( Cot( Pi() / 9 ), 6 ) OK
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

   Check( 'Round( Cot( Pi() / 4 ), 6 ) ', Round( Cot( Pi() / 4 ), 6 ), 1 )
   Check( 'Round( Cot( Pi() / 2 ), 6 ) ', Round( Cot( Pi() / 2 ), 6 ), 0 )
   Check( 'Round( Cot( Pi() / 9 ), 6 ) ', Round( Cot( Pi() / 9 ), 6 ), 2.747477 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
