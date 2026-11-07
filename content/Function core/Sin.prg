/*
 * $DOC$
 * $NAME$
 * Sin()
 *
 * $ONELINER$
 * Calculate the sine of an angle in radians
 *
 * $SYNTAX$
 * Sin( nRadians ) --> nSine
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

   Check( 'Sin( 0 )                      ', Sin( 0 ), 0 )
   Check( 'Round( Sin( Pi() / 4 ), 6 )   ', Round( Sin( Pi() / 4 ), 6 ), 0.707107 )
   Check( 'Sin( Pi() / 2 )               ', Sin( Pi() / 2 ), 1 )
   Check( 'Round( Sin( DToR( 30 ) ), 6 ) ', Round( Sin( DToR( 30 ) ), 6 ), 0.5 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
