/*
 * $DOC$
 * $NAME$
 * Cos()
 *
 * $ONELINER$
 * Calculate the cosine of an angle in radians
 *
 * $SYNTAX$
 * Cos( nRadians ) --> nCosine
 *
 * $ARGUMENTS$
 * nRadians
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

   Check( 'Cos( 0 )                      ', Cos( 0 ), 1 )
   Check( 'Round( Cos( Pi() / 4 ), 6 )   ', Round( Cos( Pi() / 4 ), 6 ), 0.707107 )
   Check( 'Round( Cos( Pi() / 2 ), 6 )   ', Round( Cos( Pi() / 2 ), 6 ), 0 )
   Check( 'Round( Cos( DToR( 60 ) ), 6 ) ', Round( Cos( DToR( 60 ) ), 6 ), 0.5 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
