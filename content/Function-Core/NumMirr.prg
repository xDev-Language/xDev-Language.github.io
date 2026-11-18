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
 * `lEightBits`: .T. reverses only bits 0..7; any other value or omission reverses all 16 bits.
 *
 * $RETURNS$
 * An integer in 0..65535 with the selected low bits reversed.
 *
 * $DESCRIPTION$
 * Returns the reversed bits as a non-negative integer. In 8-bit mode, the high byte is preserved. Reversing twice with the same mode restores the original value.
 * A hexadecimal string may start with spaces and leading zeroes. Reading stops at the first byte that is not a hexadecimal digit. There is no sign or 0x prefix.
 *
 * $NOTES$
 * An invalid argument gives -1 and raises no error: a value outside 0..65535, a string without a hexadecimal digit at the start, a missing argument or another type. No special hardware or 16-bit operating system is required.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Zero: OK
 * Low bit to high bit: OK
 * High bit to low bit: OK
 * All bits set: OK
 * Known value: OK
 * Eight bits preserve high byte: OK
 * Hexadecimal input: OK
 * Fraction discarded: OK
 * Reverse twice: OK
 * Reverse twice in byte mode: OK
 * Other mode is 16 bits: OK
 * Invalid: negative: OK
 * Invalid: range: OK
 * Invalid: missing: OK
 * Invalid: too many hex digits: OK
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
   s_Check( 'Other mode is 16 bits', NumMirr( 1, 1 ), 32768 )
   s_Check( 'Invalid: negative', NumMirr( -1 ), -1 )
   s_Check( 'Invalid: range', NumMirr( "10000" ), -1 )
   s_Check( 'Invalid: missing', NumMirr(), -1 )
   s_Check( 'Invalid: too many hex digits', NumMirr( "10000000000000000" ), -1 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected, "OK", "ERROR" ) )

RETURN
