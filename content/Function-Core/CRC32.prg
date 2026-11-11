/*
 * $DOC$
 *
 * $NAME$
 * CRC32()
 *
 * $ONELINER$
 * Calculate the standard CRC-32/ISO-HDLC checksum
 *
 * $SYNTAX$
 * CRC32( cString ) --> nCRC32
 *
 * $ARGUMENTS$
 * cString is the exact byte stream to checksum.
 *
 * $RETURNS$
 * The CRC as a non-negative integer in 0..4294967295.
 *
 * $DESCRIPTION$
 * Uses the reflected polynomial 0xEDB88320, initial state 0xFFFFFFFF and final bit inversion. This is the
 * CRC-32 used by ZIP and PNG. The standard check value for the ASCII string 123456789 is 0xCBF43926.
 *
 * $NOTES$
 * Embedded zeroes and UTF-8 bytes are processed without conversion. CRC32 is not a cryptographic hash. Wrong or
 * missing arguments raise error 1102. Deliberately invalid calls in the example must produce the stated error
 * code; s_ErrorCode() catches it so execution continues.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Empty: OK
 * Standard check vector: OK
 * Standard vector in hex: OK
 * Lowercase abc: OK
 * Zero byte: OK
 * Case matters: OK
 * Binary suffix matters: OK
 * Expected argument error: OK
 * Expected missing argument error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * CheckSum(), MD5(), StrToHex()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Empty', CRC32( "" ), 0 )
   s_Check( 'Standard check vector', CRC32( "123456789" ), 3421780262 )
   s_Check( 'Standard vector in hex', NumToHex( CRC32( "123456789" ) ), "CBF43926" )
   s_Check( 'Lowercase abc', CRC32( "abc" ), 891568578 )
   s_Check( 'Zero byte', CRC32( Chr( 0 ) ), 3523407757 )
   s_Check( 'Case matters', CRC32( "ABC" ) != CRC32( "abc" ), .T. )
   s_Check( 'Binary suffix matters', CRC32( "abc" + Chr( 0 ) ) != CRC32( "abc" ), .T. )
   s_Check( 'Expected argument error', s_ErrorCode( {|| CRC32( NIL ) } ), 1102 )
   s_Check( 'Expected missing argument error', s_ErrorCode( {|| CRC32() } ), 1102 )

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
