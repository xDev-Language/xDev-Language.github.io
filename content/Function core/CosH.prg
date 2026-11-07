/*
 * $DOC$
 * $NAME$
 * CosH()
 *
 * $ONELINER$
 * Calculate the hyperbolic cosine
 *
 * $SYNTAX$
 * CosH( nValue ) --> nHyperbolicCosine
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

   Check( 'CosH( 0 )               ', CosH( 0 ), 1 )
   Check( 'Round( CosH( 1 ), 6 )   ', Round( CosH( 1 ), 6 ), 1.543081 )
   Check( 'CosH( -2 ) == CosH( 2 ) ', CosH( -2 ) == CosH( 2 ), .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
