/*
 * $DOC$
 * $NAME$
 * IntPos()
 *
 * $ONELINER$
 * Convert a signed 16-bit or 32-bit integer to an unsigned one
 *
 * $SYNTAX$
 * IntPos( nSigned | cHexSigned, [l32Bit] ) --> nUnsigned
 *
 * $ARGUMENTS$
 * `nSigned | cHexSigned` A signed integer, or the same value as a string of hex digits.
 *
 * `l32Bit` .T. works with 32 bits. The default is .F., 16 bits.
 *
 * $RETURNS$
 * The unsigned value: the low 16 bits from 0 to 65535, or the low 32 bits with `l32Bit`. 0 when the
 * argument is invalid.
 *
 * $DESCRIPTION$
 * The values -1 to -32768 become 65535 to 32768. Values from 0 to 32767 stay.
 *
 * Only the low 16 bits count, so IntPos( 0 ) and IntPos( 65536 ) are both 0, and IntPos( 90000 ) is
 * 24464.
 *
 * $NOTES$
 * An invalid argument gives 0 and raises no error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * IntPos( -1 )                     OK
 * IntPos( 30000 )                  OK
 * IntPos( 65536 )                  OK
 * IntPos( 90000 )                  OK
 * IntPos( -1, .T. )                OK
 * IntPos( -60000, .T. )            OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * IntNeg()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'IntPos( -1 )                     ', IntPos( -1 ), 65535 )
   Check( 'IntPos( 30000 )                  ', IntPos( 30000 ), 30000 )
   Check( 'IntPos( 65536 )                  ', IntPos( 65536 ), 0 )
   Check( 'IntPos( 90000 )                  ', IntPos( 90000 ), 24464 )
   Check( 'IntPos( -1, .T. )                ', IntPos( -1, .T. ), 4294967295 )
   Check( 'IntPos( -60000, .T. )            ', IntPos( -60000, .T. ), 4294907296 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
