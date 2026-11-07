/*
 * $DOC$
 * $NAME$
 * TanH()
 *
 * $ONELINER$
 * Calculate the hyperbolic tangent
 *
 * $SYNTAX$
 * TanH( nValue ) --> nHyperbolicTangent
 *
 * $ARGUMENTS$
 * nValue
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

   Check( 'TanH( 0 )                ', TanH( 0 ), 0 )
   Check( 'Round( TanH( 1 ), 6 )    ', Round( TanH( 1 ), 6 ), 0.761594 )
   Check( 'TanH( -1 ) == -TanH( 1 ) ', TanH( -1 ) == -TanH( 1 ), .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
