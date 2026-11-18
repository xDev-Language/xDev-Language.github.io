/*
 * $DOC$
 * $NAME$
 * SetBit()
 *
 * $ONELINER$
 * Set bits of a number
 *
 * $SYNTAX$
 * SetBit( nLong | cHexLong, nBitPos1, [nBitPosN, ...] ) --> nNewValue
 *
 * $ARGUMENTS$
 * `nLong | cHexLong` A number, or the same number as a string of hex digits.
 *
 * `nBitPos1`, ... The bits to set, from 1 to 32. Bit 1 is the lowest bit.
 *
 * $RETURNS$
 * The number with the bits set. -1 when an argument is invalid or a position is outside 1 to 32.
 *
 * $DESCRIPTION$
 * SetBit() takes the numbers of the bits, so the mask of NumOr() is not needed.
 *
 * $NOTES$
 * An invalid argument gives -1 and raises no error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SetBit( 0, 1, 2, 5 )             OK
 * SetBit( "F0", 1 )                OK
 * SetBit( 0, 33 )                  OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ClearBit(), IsBit(), NumOr()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'SetBit( 0, 1, 2, 5 )             ', SetBit( 0, 1, 2, 5 ), 19 )
   Check( 'SetBit( "F0", 1 )                ', SetBit( "F0", 1 ), 241 )
   Check( 'SetBit( 0, 33 )                  ', SetBit( 0, 33 ), -1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
