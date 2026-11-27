/*
 * $DOC$
 * $NAME$
 * NumHigh()
 *
 * $ONELINER$
 * Return the high byte of an unsigned 16-bit integer
 *
 * $SYNTAX$
 * NumHigh( nInteger | cHex ) --> nHighByte
 *
 * $ARGUMENTS$
 * `nInteger`: a numeric value from 0 to 65535 inclusive. A fractional part
 * is discarded towards zero after checking this range.
 * `cHex`: alternatively, hexadecimal text using digits 0..9, A..F or a..f.
 * The decoded value must fit in 16 bits. Leading zeroes are allowed.
 *
 * $RETURNS$
 * The high byte as an integer from 0 to 255.
 *
 * $DESCRIPTION$
 * A 16-bit integer consists of a low byte (bits 0..7) and a high byte
 * (bits 8..15). NumHigh() returns the high one without changing the argument.
 * The operation works on contemporary machines; it extracts data bits and
 * requires neither a 16-bit operating system nor special hardware.
 * A hexadecimal string may start with spaces. Reading stops at the first
 * byte that is not a hexadecimal digit, so "ABCD!FF" is read as "ABCD".
 *
 * $NOTES$
 * An invalid argument gives -1 and raises no error: a value outside
 * 0..65535, a string without a hexadecimal digit at the start, a missing
 * argument, NIL or another type.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Zero: OK
 * Numeric word: OK
 * Hexadecimal word: OK
 * Mixed case: OK
 * One byte: OK
 * Byte boundary: OK
 * High bit: OK
 * Maximum: OK
 * Leading zeroes: OK
 * Leading spaces: OK
 * Stop at invalid byte: OK
 * Fraction discarded: OK
 * Matches binary representation: OK
 * Invalid: negative: OK
 * Invalid: numeric range: OK
 * Invalid: hexadecimal range: OK
 * Invalid: empty string: OK
 * Invalid: non-hex first byte: OK
 * Invalid: logical: OK
 * Invalid: NIL: OK
 * Invalid: missing argument: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * NumLow(), W2Bin(), Bin2W(), HexToNum(), NumToHex()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Zero', NumHigh( 0 ), 0 )
   s_Check( 'Numeric word', NumHigh( 43981 ), 171 )
   s_Check( 'Hexadecimal word', NumHigh( "ABCD" ), 171 )
   s_Check( 'Mixed case', NumHigh( "aBcD" ), 171 )
   s_Check( 'One byte', NumHigh( 255 ), 0 )
   s_Check( 'Byte boundary', NumHigh( 256 ), 1 )
   s_Check( 'High bit', NumHigh( 32768 ), 128 )
   s_Check( 'Maximum', NumHigh( 65535 ), 255 )
   s_Check( 'Leading zeroes', NumHigh( "0000ABCD" ), 171 )
   s_Check( 'Leading spaces', NumHigh( "  ABCD" ), 171 )
   s_Check( 'Stop at invalid byte', NumHigh( "ABCD!FF" ), 171 )
   s_Check( 'Fraction discarded', NumHigh( 43981.75 ), 171 )
   s_Check( 'Matches binary representation', NumHigh( 43981 ), Asc( Right( W2Bin( 43981 ), 1 ) ) )

   s_Check( 'Invalid: negative', NumHigh( -1 ), -1 )
   s_Check( 'Invalid: numeric range', NumHigh( 65536 ), -1 )
   s_Check( 'Invalid: hexadecimal range', NumHigh( "10000" ), -1 )
   s_Check( 'Invalid: empty string', NumHigh( "" ), -1 )
   s_Check( 'Invalid: non-hex first byte', NumHigh( "Z12" ), -1 )
   s_Check( 'Invalid: logical', NumHigh( .T. ), -1 )
   s_Check( 'Invalid: NIL', NumHigh( NIL ), -1 )
   s_Check( 'Invalid: missing argument', NumHigh(), -1 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected, "OK", "ERROR" ) )

RETURN
