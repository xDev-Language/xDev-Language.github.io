/*
 * $DOC$
 * $NAME$
 * DToR()
 *
 * $ONELINER$
 * Convert degrees to radians
 *
 * $SYNTAX$
 * DToR( nDegrees ) --> nRadians
 *
 * $ARGUMENTS$
 * nDegrees
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
 * DToR( 0 )                OK
 * Round( DToR( 180 ), 6 )  OK
 * Round( DToR( 360 ), 6 )  OK
 * Round( DToR( -180 ), 6 ) OK
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

   Check( 'DToR( 0 )                ', DToR( 0 ), 0 )
   Check( 'Round( DToR( 180 ), 6 )  ', Round( DToR( 180 ), 6 ), 3.141593 )
   Check( 'Round( DToR( 360 ), 6 )  ', Round( DToR( 360 ), 6 ), 6.283185 )
   Check( 'Round( DToR( -180 ), 6 ) ', Round( DToR( -180 ), 6 ), -3.141593 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
