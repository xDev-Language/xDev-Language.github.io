/*
 * $DOC$
 * $NAME$
 * HexToNum()
 *
 * $ONELINER$
 * Decode hexadecimal digits as a signed 64-bit integer
 *
 * $SYNTAX$
 * HexToNum( cHexString ) --> nNumber
 *
 * $ARGUMENTS$
 * `cHexString`: a string whose initial bytes are hexadecimal digits 0..9,
 * A..F or a..f. No leading spaces, sign or 0x prefix is recognized.
 *
 * $RETURNS$
 * An integer. An empty string or a non-hexadecimal first byte gives 0.
 *
 * $DESCRIPTION$
 * Reads digits from the beginning of the string and stops at the first
 * non-hexadecimal byte, including an embedded Chr(0). Any remaining bytes
 * are ignored. The conversion is case-insensitive for hexadecimal letters.
 * The result represents a 64-bit two's-complement bit pattern: values up
 * to 7FFFFFFFFFFFFFFF are non-negative; 8000000000000000 represents the
 * minimum signed integer, and FFFFFFFFFFFFFFFF represents -1.
 * NumToHex() performs the reverse conversion. Leading zeroes are allowed.
 *
 * $NOTES$
 * A value requiring more than 64 bits raises integer overflow error 3106;
 * it is not truncated or wrapped. A missing argument, NIL or a non-string
 * argument raises argument error 1102. Invalid text characters stop parsing
 * and do not themselves raise an error.
 * The example catches deliberate argument errors and overflow, and verifies
 * their error codes. A missing or different error fails the check.
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
 * NumToHex(), HexToStr(), StrToHex(), CToN()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Zero', HexToNum( "0" ), 0 )
   s_Check( 'One', HexToNum( "1" ), 1 )
   s_Check( 'Uppercase', HexToNum( "FF" ), 255 )
   s_Check( 'Mixed case', HexToNum( "aBcD" ), 43981 )
   s_Check( '16 bits', HexToNum( "FFFF" ), 65535 )
   s_Check( '32 bits', HexToNum( "FFFFFFFF" ), 4294967295 )
   s_Check( 'Maximum signed', HexToNum( "7FFFFFFFFFFFFFFF" ), 9223372036854775807 )
   s_Check( 'Minimum signed', HexToNum( "8000000000000000" ), -9223372036854775807 - 1 )
   s_Check( 'All bits set', HexToNum( "FFFFFFFFFFFFFFFF" ), -1 )
   s_Check( 'Negative value', HexToNum( "ffffffffffffff80" ), -128 )
   s_Check( 'Leading zeroes', HexToNum( "000000000000000000FF" ), 255 )
   s_Check( 'Stop at invalid byte', HexToNum( "1FG9" ), 31 )
   s_Check( 'Stop at zero byte', HexToNum( "FF" + Chr( 0 ) + "AA" ), 255 )
   s_Check( 'Empty string', HexToNum( "" ), 0 )
   s_Check( 'Non-hex first byte', HexToNum( "Z12" ), 0 )
   s_Check( 'No leading spaces', HexToNum( " FF" ), 0 )
   s_Check( 'No sign', HexToNum( "-FF" ), 0 )
   s_Check( 'No prefix', HexToNum( "0xFF" ), 0 )
   s_Check( 'Round trip positive', HexToNum( NumToHex( 123456789 ) ), 123456789 )
   s_Check( 'Round trip negative', HexToNum( NumToHex( -128 ) ), -128 )

   s_Check( 'Expected overflow', s_ErrorCode( {|| HexToNum( "10000000000000000" ) } ), 3106 )
   s_Check( 'Expected argument error: number', s_ErrorCode( {|| HexToNum( 255 ) } ), 1102 )
   s_Check( 'Expected argument error: NIL', s_ErrorCode( {|| HexToNum( NIL ) } ), 1102 )
   s_Check( 'Expected argument error: missing', s_ErrorCode( {|| HexToNum() } ), 1102 )

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
