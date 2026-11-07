/*
 * $DOC$
 * $NAME$
 * Atn2()
 *
 * $ONELINER$
 * Calculate the arc tangent from Cartesian coordinates
 *
 * $SYNTAX$
 * Atn2( nY, nX ) --> nRadians
 *
 * $ARGUMENTS$
 * nY
 * nX
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

   LOCAL nY := Sin( DToR( 30 ) )
   LOCAL nX := Cos( DToR( 30 ) )

   Check( 'Round( RToD( Atn2( nY, nX ) ), 6 ) ', Round( RToD( Atn2( nY, nX ) ), 6 ), 30 )
   Check( 'Atn2( 0, 1 )                       ', Atn2( 0, 1 ), 0 )
   Check( 'Round( RToD( Atn2( 1, 0 ) ), 6 )   ', Round( RToD( Atn2( 1, 0 ) ), 6 ), 90 )
   Check( 'Round( RToD( Atn2( 1, -1 ) ), 6 )  ', Round( RToD( Atn2( 1, -1 ) ), 6 ), 135 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
