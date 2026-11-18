/*
 * $DOC$
 * $NAME$
 * NumLow()
 *
 * $ONELINER$
 * Return the low byte of an unsigned 16-bit integer
 *
 * $SYNTAX$
 * NumLow( nInteger | cHex ) --> nLowByte
 *
 * $ARGUMENTS$
 * `nInteger`: a numeric value from 0 to 65535 inclusive. A fractional part
 * is discarded towards zero after checking this range.
 * `cHex`: alternatively, hexadecimal text using digits 0..9, A..F or a..f.
 * The decoded value must fit in 16 bits. Leading zeroes are allowed.
 *
 * $RETURNS$
 * The low byte as an integer from 0 to 255.
 *
 * $DESCRIPTION$
 * A 16-bit integer consists of a low byte (bits 0..7) and a high byte
 * (bits 8..15). NumLow() returns the low one without changing the argument.
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
 * NumHigh(), W2Bin(), Bin2W(), HexToNum(), NumToHex()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Zero', NumLow( 0 ), 0 )
   s_Check( 'Numeric word', NumLow( 43981 ), 205 )
   s_Check( 'Hexadecimal word', NumLow( "ABCD" ), 205 )
   s_Check( 'Mixed case', NumLow( "aBcD" ), 205 )
   s_Check( 'One byte', NumLow( 255 ), 255 )
   s_Check( 'Byte boundary', NumLow( 256 ), 0 )
   s_Check( 'High bit', NumLow( 32768 ), 0 )
   s_Check( 'Maximum', NumLow( 65535 ), 255 )
   s_Check( 'Leading zeroes', NumLow( "0000ABCD" ), 205 )
   s_Check( 'Leading spaces', NumLow( "  ABCD" ), 205 )
   s_Check( 'Stop at invalid byte', NumLow( "ABCD!FF" ), 205 )
   s_Check( 'Fraction discarded', NumLow( 43981.75 ), 205 )
   s_Check( 'Matches binary representation', NumLow( 43981 ), Asc( Left( W2Bin( 43981 ), 1 ) ) )

   s_Check( 'Invalid: negative', NumLow( -1 ), -1 )
   s_Check( 'Invalid: numeric range', NumLow( 65536 ), -1 )
   s_Check( 'Invalid: hexadecimal range', NumLow( "10000" ), -1 )
   s_Check( 'Invalid: empty string', NumLow( "" ), -1 )
   s_Check( 'Invalid: non-hex first byte', NumLow( "Z12" ), -1 )
   s_Check( 'Invalid: logical', NumLow( .T. ), -1 )
   s_Check( 'Invalid: NIL', NumLow( NIL ), -1 )
   s_Check( 'Invalid: missing argument', NumLow(), -1 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected, "OK", "ERROR" ) )

RETURN
