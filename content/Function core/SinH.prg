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
