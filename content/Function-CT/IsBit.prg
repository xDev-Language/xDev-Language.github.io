/*
 * $DOC$
 * $NAME$
 * IsBit()
 *
 * $ONELINER$
 * Test a bit of a number
 *
 * $SYNTAX$
 * IsBit( nLong | cHexLong, [nBitPos] ) --> lSet
 *
 * $ARGUMENTS$
 * `nLong | cHexLong` A 32-bit number, or the same number as a string of hex digits, for example
 * "FF". A negative number is taken as a signed 32-bit value, so all its high bits are set.
 *
 * `nBitPos` The bit to test, from 1 to 32. Bit 1 is the lowest bit. The default is 1.
 *
 * $RETURNS$
 * .T. when the bit is set, otherwise .F. An invalid argument or a position outside 1 to 32 gives
 * .F.
 *
 * $DESCRIPTION$
 * IsBit() tests one bit without masking and comparing. It counts the bits from 1, like the tables
 * of the keyboard and the hardware status bytes, for example KbdStat().
 *
 * $NOTES$
 * BitIsSet() tests a bit too, but counts the bits from 0: IsBit( n, 1 ) is BitIsSet( n, 0 ).
 *
 * An invalid argument gives .F. and raises no error: a number outside the 32-bit range, a hex
 * string with a larger value, a string without a hex digit at the start, or another type.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * IsBit( 5 )                       OK
 * IsBit( 5, 2 )                    OK
 * IsBit( 5, 3 )                    OK
 * IsBit( "FF", 8 )                 OK
 * IsBit( "100", 9 )                OK
 * IsBit( -1, 32 )                  OK
 * IsBit( 5, 33 )                   OK
 * IsBit( .T. )                     OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * BitIsSet(), KbdStat()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'IsBit( 5 )                       ', IsBit( 5 ), .T. )
   Check( 'IsBit( 5, 2 )                    ', IsBit( 5, 2 ), .F. )
   Check( 'IsBit( 5, 3 )                    ', IsBit( 5, 3 ), .T. )
   Check( 'IsBit( "FF", 8 )                 ', IsBit( "FF", 8 ), .T. )
   Check( 'IsBit( "100", 9 )                ', IsBit( "100", 9 ), .T. )
   Check( 'IsBit( -1, 32 )                  ', IsBit( -1, 32 ), .T. )
   Check( 'IsBit( 5, 33 )                   ', IsBit( 5, 33 ), .F. )
   Check( 'IsBit( .T. )                     ', IsBit( .T. ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
