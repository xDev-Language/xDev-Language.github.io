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
 * For hexadecimal strings, parsing follows HexToNum(): it stops at the
 * first non-hexadecimal byte, with no leading spaces, sign or 0x prefix.
 * An empty string or a non-hexadecimal first byte therefore gives 0.
 *
 * $NOTES$
 * Numbers or decoded hexadecimal values outside 0..65535 raise argument
 * error 1102. A hexadecimal value requiring more than 64 bits raises
 * integer overflow error 3106. Missing arguments, NIL and other types raise
 * error 1102. The deliberately invalid calls below verify these codes;
 * s_ErrorCode() catches each error so the example can continue.
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
   s_Check( 'Stop at invalid byte', NumHigh( "ABCD!FF" ), 171 )
   s_Check( 'Empty string', NumHigh( "" ), 0 )
   s_Check( 'Non-hex first byte', NumHigh( "Z12" ), 0 )
   s_Check( 'Fraction discarded', NumHigh( 43981.75 ), 171 )
   s_Check( 'Matches binary representation', NumHigh( 43981 ), Asc( Right( W2Bin( 43981 ), 1 ) ) )

   s_Check( 'Expected error: negative', s_ErrorCode( {|| NumHigh( -1 ) } ), 1102 )
   s_Check( 'Expected error: numeric range', s_ErrorCode( {|| NumHigh( 65536 ) } ), 1102 )
   s_Check( 'Expected error: hexadecimal range', s_ErrorCode( {|| NumHigh( "10000" ) } ), 1102 )
   s_Check( 'Expected error: logical', s_ErrorCode( {|| NumHigh( .T. ) } ), 1102 )
   s_Check( 'Expected error: NIL', s_ErrorCode( {|| NumHigh( NIL ) } ), 1102 )
   s_Check( 'Expected error: missing argument', s_ErrorCode( {|| NumHigh() } ), 1102 )
   s_Check( 'Expected overflow', s_ErrorCode( {|| NumHigh( "10000000000000000" ) } ), 3106 )

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
