/*
 * $DOC$
 * $NAME$
 * Mantissa()
 *
 * $ONELINER$
 * Calculate the mantissa of a floating point number
 *
 * $SYNTAX$
 * Mantissa( nFloat ) --> nMantissa
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

   LOCAL nValue := 123.456

   Check( 'Mantissa( 0 )                               ', Mantissa( 0 ), 0 )
   Check( 'Mantissa( 100 )                             ', Mantissa( 100 ), 1.5625 )
   Check( 'Mantissa( -100 )                            ', Mantissa( -100 ), -1.5625 )
   Check( 'Round( Mantissa( 0.01 ), 6 )                ', Round( Mantissa( 0.01 ), 6 ), 1.28 )
   Check( 'Mantissa( -1.01 )                           ', Mantissa( -1.01 ), -1.01 )
   Check( 'Mantissa( nValue ) * 2 ^ Exponent( nValue ) ', Mantissa( nValue ) * 2 ^ Exponent( nValue ), nValue )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
