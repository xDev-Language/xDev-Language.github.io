/*
 * $DOC$
 *
 * $NAME$
 * CheckSum()
 *
 * $ONELINER$
 * Calculate the legacy Clipper Tools 32-bit checksum
 *
 * $SYNTAX$
 * CheckSum( cString ) --> nCheckSum
 *
 * $ARGUMENTS$
 * cString is any byte string.
 *
 * $RETURNS$
 * An unsigned 32-bit checksum returned as a non-negative integer.
 *
 * $DESCRIPTION$
 * Adds the overlapping little-endian 16-bit words starting at every byte, with an implied final zero byte. The
 * low 24 bits hold the sum modulo 2^24; the high byte holds the input length modulo 256. This is the Clipper
 * Tools CheckSum algorithm, not Adler-32.
 *
 * $NOTES$
 * This is an integrity check, not a cryptographic hash. Binary zeroes are included. Wrong or missing arguments
 * raise error 1102. Deliberately invalid calls in the example must produce the stated error code; s_ErrorCode()
 * catches it so execution continues.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Empty: OK
 * One byte: OK
 * Two bytes: OK
 * Three bytes: OK
 * Unsigned binary byte: OK
 * Length in high byte: OK
 * Length wraps modulo 256: OK
 * Order matters: OK
 * Expected argument error: OK
 * Expected missing argument error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * CRC32(), MD5()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Empty', CheckSum( "" ), 0 )
   s_Check( 'One byte', CheckSum( "A" ), 16777281 )
   s_Check( 'Two bytes', CheckSum( "AB" ), 33571459 )
   s_Check( 'Three bytes', CheckSum( "ABC" ), 50365894 )
   s_Check( 'Unsigned binary byte', CheckSum( Chr( 0 ) + Chr( 255 ) ), 33619967 )
   s_Check( 'Length in high byte', CheckSum( Replicate( Chr( 0 ), 255 ) ), 4278190080 )
   s_Check( 'Length wraps modulo 256', CheckSum( Replicate( Chr( 0 ), 256 ) ), 0 )
   s_Check( 'Order matters', CheckSum( "AB" ) != CheckSum( "BA" ), .T. )
   s_Check( 'Expected argument error', s_ErrorCode( {|| CheckSum( 1 ) } ), 1102 )
   s_Check( 'Expected missing argument error', s_ErrorCode( {|| CheckSum() } ), 1102 )

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
