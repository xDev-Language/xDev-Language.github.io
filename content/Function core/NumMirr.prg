/*
 * $DOC$
 *
 * $NAME$
 * NumMirr()
 *
 * $ONELINER$
 * Reverse the low 8 or 16 bits of a 16-bit integer
 *
 * $SYNTAX$
 * NumMirr( nInteger | cHex, [lEightBits] ) --> nInteger
 *
 * $ARGUMENTS$
 * `nInteger | cHex`: a number in 0..65535 or hexadecimal text in that range. Numeric fractions are discarded after range checking.
 * `lEightBits`: .T. reverses only bits 0..7; .F., NIL or omission reverses all 16 bits.
 *
 * $RETURNS$
 * An integer in 0..65535 with the selected low bits reversed.
 *
 * $DESCRIPTION$
 * Returns the reversed bits as a non-negative integer. In 8-bit mode, the high byte is preserved. Reversing twice with the same mode restores the original value.
 * Hexadecimal input follows HexToNum(): leading zeroes are allowed and parsing stops at the first non-hexadecimal byte. There is no sign, whitespace or 0x prefix recognition.
 *
 * $NOTES$
 * Wrong argument types or values outside 0..65535 raise error 1102. Hexadecimal input exceeding 64 bits raises overflow error 3106. No special hardware or 16-bit operating system is required.
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
 * NumMirrX(), NumHigh(), NumLow(), HexToNum()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Zero', NumMirr( 0 ), 0 )
   s_Check( 'Low bit to high bit', NumMirr( 1 ), 32768 )
   s_Check( 'High bit to low bit', NumMirr( 32768 ), 1 )
   s_Check( 'All bits set', NumMirr( 65535 ), 65535 )
   s_Check( 'Known value', NumMirr( 4209 ), 36360 )
   s_Check( 'Eight bits preserve high byte', NumMirr( 4209, .T. ), 4238 )
   s_Check( 'Hexadecimal input', NumMirr( "1071" ), 36360 )
   s_Check( 'Fraction discarded', NumMirr( 1.75 ), 32768 )
   s_Check( 'Reverse twice', NumMirr( NumMirr( 43981 ) ), 43981 )
   s_Check( 'Reverse twice in byte mode', NumMirr( NumMirr( 43981, .T. ), .T. ), 43981 )
   s_Check( 'Expected error: negative', s_ErrorCode( {|| NumMirr( -1 ) } ), 1102 )
   s_Check( 'Expected error: range', s_ErrorCode( {|| NumMirr( "10000" ) } ), 1102 )
   s_Check( 'Expected error: mode', s_ErrorCode( {|| NumMirr( 1, 1 ) } ), 1102 )
   s_Check( 'Expected error: missing', s_ErrorCode( {|| NumMirr() } ), 1102 )
   s_Check( 'Expected overflow', s_ErrorCode( {|| NumMirr( "10000000000000000" ) } ), 3106 )

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
