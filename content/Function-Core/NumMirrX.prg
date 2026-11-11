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
 * Hexadecimal input uses the same parsing rules as HexToNum(). This function operates on data bits and runs on contemporary machines.
 *
 * $NOTES$
 * Wrong argument types, a width outside 1..32 or a value outside the unsigned 32-bit range raises error 1102. Hexadecimal input requiring more than 64 bits raises overflow error 3106.
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
 * Expected error: zero width: OK
 * Expected error: excessive width: OK
 * Expected error: negative value: OK
 * Expected error: range: OK
 * Expected error: missing value: OK
 * Expected overflow: OK
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
   s_Check( 'Expected error: zero width', s_ErrorCode( {|| NumMirrX( 0, 1 ) } ), 1102 )
   s_Check( 'Expected error: excessive width', s_ErrorCode( {|| NumMirrX( 33, 1 ) } ), 1102 )
   s_Check( 'Expected error: negative value', s_ErrorCode( {|| NumMirrX( 8, -1 ) } ), 1102 )
   s_Check( 'Expected error: range', s_ErrorCode( {|| NumMirrX( 8, "100000000" ) } ), 1102 )
   s_Check( 'Expected error: missing value', s_ErrorCode( {|| NumMirrX( 8 ) } ), 1102 )
   s_Check( 'Expected overflow', s_ErrorCode( {|| NumMirrX( 8, "10000000000000000" ) } ), 3106 )

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
