/*
 * $DOC$
 * $NAME$
 * IntNeg()
 *
 * $ONELINER$
 * Convert an unsigned 16-bit or 32-bit integer to a signed one
 *
 * $SYNTAX$
 * IntNeg( nUnsigned | cHexUnsigned, [l32Bit] ) --> nSigned
 *
 * $ARGUMENTS$
 * `nUnsigned | cHexUnsigned` An unsigned integer, or the same value as a string of hex digits.
 *
 * `l32Bit` .T. reads the value as 32 bits. The default is .F., 16 bits.
 *
 * $RETURNS$
 * The signed value. 0 when the argument is invalid, negative or too large: above 65535 for 16
 * bits, above 4294967295 for 32 bits.
 *
 * $DESCRIPTION$
 * For 16 bits the values 0 to 32767 stay, and 32768 to 65535 become -32768 to -1. For 32 bits the
 * limit is 2147483647.
 *
 * Use it for values from files and devices that store signed integers in two's complement.
 *
 * $NOTES$
 * An invalid argument gives 0 and raises no error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * IntNeg( 32767 )                  OK
 * IntNeg( 32768 )                  OK
 * IntNeg( 60000 )                  OK
 * IntNeg( "FFFF" )                 OK
 * IntNeg( "D0000000", .T. )        OK
 * IntNeg( 90000 ), too large       OK
 * IntNeg( -1 ), negative           OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * IntPos()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'IntNeg( 32767 )                  ', IntNeg( 32767 ), 32767 )
   Check( 'IntNeg( 32768 )                  ', IntNeg( 32768 ), -32768 )
   Check( 'IntNeg( 60000 )                  ', IntNeg( 60000 ), -5536 )
   Check( 'IntNeg( "FFFF" )                 ', IntNeg( "FFFF" ), -1 )
   Check( 'IntNeg( "D0000000", .T. )        ', IntNeg( "D0000000", .T. ), -805306368 )
   Check( 'IntNeg( 90000 ), too large       ', IntNeg( 90000 ), 0 )
   Check( 'IntNeg( -1 ), negative           ', IntNeg( -1 ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
