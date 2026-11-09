/*
 * $DOC$
 * $NAME$
 * SinH()
 *
 * $ONELINER$
 * Calculate the hyperbolic sine
 *
 * $SYNTAX$
 * SinH( nValue ) --> nHyperbolicSine
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
 * SinH( 0 )                OK
 * Round( SinH( 1 ), 6 )    OK
 * SinH( -1 ) == -SinH( 1 ) OK
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

   Check( 'SinH( 0 )                ', SinH( 0 ), 0 )
   Check( 'Round( SinH( 1 ), 6 )    ', Round( SinH( 1 ), 6 ), 1.175201 )
   Check( 'SinH( -1 ) == -SinH( 1 ) ', SinH( -1 ) == -SinH( 1 ), .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
