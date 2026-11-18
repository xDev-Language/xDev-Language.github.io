/*
 * $DOC$
 *
 * $NAME$
 * NumMirrX()
 *
 * $ONELINER$
 * Reverse a selected number of low bits of a 32-bit integer
 *
 * $SYNTAX$
 * NumMirrX( nMaxBits, nInteger | cHex ) --> nInteger
 *
 * $ARGUMENTS$
 * `nMaxBits`: number of low bits to reverse, from 1 to 32; a fractional part is discarded after range checking.
 * `nInteger | cHex`: numeric or hexadecimal value in 0..4294967295.
 *
 * $RETURNS$
 * An integer in 0..4294967295 with the selected low bits reversed.
 *
 * $DESCRIPTION$
 * Reverses the least significant nMaxBits bits while preserving the higher bits. The result is a non-negative integer, including when bit 31 is set.
 * A hexadecimal string may start with spaces. Reading stops at the first byte that is not a hexadecimal digit. This function operates on data bits and runs on contemporary machines.
 *
 * $NOTES$
 * An invalid argument gives -1 and raises no error: a width outside 1..32, a value outside the unsigned 32-bit range, a string without a hexadecimal digit at the start, a missing argument or another type.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Zero: OK
 * Full width low bit: OK
 * Full width high bit: OK
 * All bits set: OK
 * One bit is unchanged: OK
 * Four low bits: OK
 * Hexadecimal input: OK
 * Sixteen bits: OK
 * Reverse twice: OK
 * Fractional width: OK
 * Invalid: zero width: OK
 * Invalid: excessive width: OK
 * Invalid: negative value: OK
 * Invalid: range: OK
 * Invalid: missing value: OK
 * Invalid: too many hex digits: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * NumMirr(), NumToHex(), HexToNum()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Zero', NumMirrX( 32, 0 ), 0 )
   s_Check( 'Full width low bit', NumMirrX( 32, 1 ), 2147483648 )
   s_Check( 'Full width high bit', NumMirrX( 32, 2147483648 ), 1 )
   s_Check( 'All bits set', NumMirrX( 32, 4294967295 ), 4294967295 )
   s_Check( 'One bit is unchanged', NumMirrX( 1, 123 ), 123 )
   s_Check( 'Four low bits', NumMirrX( 4, 18 ), 20 )
   s_Check( 'Hexadecimal input', NumMirrX( 8, "1071" ), 4238 )
   s_Check( 'Sixteen bits', NumMirrX( 16, 4209 ), 36360 )
   s_Check( 'Reverse twice', NumMirrX( 32, NumMirrX( 32, 123456789 ) ), 123456789 )
   s_Check( 'Fractional width', NumMirrX( 4.5, 18 ), 20 )
   s_Check( 'Invalid: zero width', NumMirrX( 0, 1 ), -1 )
   s_Check( 'Invalid: excessive width', NumMirrX( 33, 1 ), -1 )
   s_Check( 'Invalid: negative value', NumMirrX( 8, -1 ), -1 )
   s_Check( 'Invalid: range', NumMirrX( 8, "100000000" ), -1 )
   s_Check( 'Invalid: missing value', NumMirrX( 8 ), -1 )
   s_Check( 'Invalid: too many hex digits', NumMirrX( 8, "10000000000000000" ), -1 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected, "OK", "ERROR" ) )

RETURN
