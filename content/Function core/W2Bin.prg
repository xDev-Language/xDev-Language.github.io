/*
 * $DOC$
 * $NAME$
 * W2Bin()
 *
 * $ONELINER$
 * Encode an unsigned 16-bit number as two bytes
 *
 * $SYNTAX$
 * W2Bin( nNumber ) --> cInteger
 *
 * $ARGUMENTS$
 * `nNumber`: a numeric value from 0 to 65535 inclusive. A fractional part
 * is discarded towards zero after checking this range.
 *
 * $RETURNS$
 * A string of exactly two bytes, with the least significant byte first
 * (little-endian). The bytes may include Chr(0).
 *
 * $DESCRIPTION$
 * Encodes a 16-bit unsigned integer for binary data and file formats.
 * Bin2W() decodes the result. This function does not return decimal text;
 * use Str() when a printable number is needed.
 *
 * $NOTES$
 * A missing argument, NIL, a non-numeric value or a number outside 0..65535
 * raises argument error 1102. Values do not wrap around at either boundary.
 * The example catches deliberately invalid calls and checks error 1102.
 * A missing or different error is reported as ERROR, not as a passing test.
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
 * Bin2W(), I2Bin(), L2Bin(), Asc(), StrToHex()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cWord := W2Bin( 4660 )

   s_Check( 'Two bytes', Len( cWord ), 2 )
   s_Check( 'Low byte first', Asc( Left( cWord, 1 ) ), 52 )
   s_Check( 'High byte second', Asc( Right( cWord, 1 ) ), 18 )
   s_Check( 'Zero bytes', W2Bin( 0 ), Chr( 0 ) + Chr( 0 ) )
   s_Check( 'One', W2Bin( 1 ), Chr( 1 ) + Chr( 0 ) )
   s_Check( '256', W2Bin( 256 ), Chr( 0 ) + Chr( 1 ) )
   s_Check( 'High bit', W2Bin( 32768 ), Chr( 0 ) + Chr( 128 ) )
   s_Check( 'Maximum', W2Bin( 65535 ), Chr( 255 ) + Chr( 255 ) )
   s_Check( 'Round trip zero', Bin2W( W2Bin( 0 ) ), 0 )
   s_Check( 'Round trip value', Bin2W( cWord ), 4660 )
   s_Check( 'Round trip maximum', Bin2W( W2Bin( 65535 ) ), 65535 )
   s_Check( 'Fraction discarded', Bin2W( W2Bin( 12.75 ) ), 12 )

   s_Check( 'Expected error: negative', s_ErrorCode( {|| W2Bin( -1 ) } ), 1102 )
   s_Check( 'Expected error: too large', s_ErrorCode( {|| W2Bin( 65536 ) } ), 1102 )
   s_Check( 'Expected error: string', s_ErrorCode( {|| W2Bin( "1" ) } ), 1102 )
   s_Check( 'Expected error: NIL', s_ErrorCode( {|| W2Bin( NIL ) } ), 1102 )
   s_Check( 'Expected error: missing argument', s_ErrorCode( {|| W2Bin() } ), 1102 )

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
