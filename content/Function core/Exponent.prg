/*
 * $DOC$
 * $NAME$
 * Exponent()
 *
 * $ONELINER$
 * Calculate the exponent of a floating point number
 *
 * $SYNTAX$
 * Exponent( nFloat ) --> nExponent
 *
 * $ARGUMENTS$
 * nFloat
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

   Check( 'Exponent( 0 )     ', Exponent( 0 ), 0 )
   Check( 'Exponent( 100 )   ', Exponent( 100 ), 6 )
   Check( 'Exponent( -100 )  ', Exponent( -100 ), 6 )
   Check( 'Exponent( -1.01 ) ', Exponent( -1.01 ), 0 )
   Check( 'Exponent( -2.01 ) ', Exponent( -2.01 ), 1 )
   Check( 'Exponent( 0.01 )  ', Exponent( 0.01 ), -7 )
   Check( 'Exponent( -0.01 ) ', Exponent( -0.01 ), -7 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
