/*
 * $DOC$
 *
 * $NAME$
 * LenNum()
 *
 * $ONELINER$
 * Return the unpadded display length of a number
 *
 * $SYNTAX$
 * LenNum( nNumber ) --> nLength
 *
 * $ARGUMENTS$
 * `nNumber`: a numeric value, including signed integers, UINT64 and floating-point numbers.
 *
 * $RETURNS$
 * An integer giving the length of LTrim( Str( nNumber ) ).
 *
 * $DESCRIPTION$
 * Returns the number of bytes needed by the default numeric formatting of Str(), excluding its leading padding. It is equivalent to Len( LTrim( Str( nNumber ) ) ).
 * Integers are printed in full. Floating-point numbers use 15 significant decimal digits and may use scientific notation. The sign, decimal point and exponent are included in the count. Trailing zeroes from the original source literal are not retained.
 *
 * $NOTES$
 * A missing argument, NIL or a non-numeric value raises argument error 1102. The result is a length, not the precision or memory size of a number.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Str(), Len(), LTrim()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nUnsigned AS UINT64 := 18446744073709551615

   s_Check( 'Zero', LenNum( 0 ), 1 )
   s_Check( 'Positive', LenNum( 12345 ), 5 )
   s_Check( 'Negative', LenNum( -12345 ), 6 )
   s_Check( 'Decimal point', LenNum( 100.12 ), 6 )
   s_Check( 'No retained zeroes', LenNum( 3.1400 ), 4 )
   s_Check( 'Small fraction', LenNum( 0.001 ), 5 )
   s_Check( 'Maximum signed', LenNum( 9223372036854775807 ), 19 )
   s_Check( 'Minimum signed', LenNum( -9223372036854775807 - 1 ), 20 )
   s_Check( 'Maximum unsigned', LenNum( nUnsigned ), 20 )
   s_Check( 'Scientific notation', LenNum( 1.5e30 ), Len( LTrim( Str( 1.5e30 ) ) ) )
   s_Check( 'Tiny value', LenNum( 1e-20 ), Len( LTrim( Str( 1e-20 ) ) ) )
   s_Check( 'Expected error: text', s_ErrorCode( {|| LenNum( "123" ) } ), 1102 )
   s_Check( 'Expected error: NIL', s_ErrorCode( {|| LenNum( NIL ) } ), 1102 )
   s_Check( 'Expected error: missing', s_ErrorCode( {|| LenNum() } ), 1102 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected, "OK", "ERROR" ) )

RETURN

STATIC FUNCTION s_ErrorCode( bAction )

   LOCAL nCode := 0
   LOCAL oError
   LOCAL bPrevious := ErrorBlock( {| oFailure | Break( oFailure ) } )

   BEGIN SEQUENCE
      Eval( bAction )
   RECOVER USING oError
      nCode := oError:SubCode
   END SEQUENCE
   ErrorBlock( bPrevious )

RETURN nCode
