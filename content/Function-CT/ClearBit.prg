/*
 * $DOC$
 * $NAME$
 * ClearBit()
 *
 * $ONELINER$
 * Clear bits of a number
 *
 * $SYNTAX$
 * ClearBit( nLong | cHexLong, nBitPos1, [nBitPosN, ...] ) --> nNewValue
 *
 * $ARGUMENTS$
 * `nLong | cHexLong` A number, or the same number as a string of hex digits.
 *
 * `nBitPos1`, ... The bits to clear, from 1 to 32. Bit 1 is the lowest bit.
 *
 * $RETURNS$
 * The number with the bits cleared. -1 when an argument is invalid or a position is outside 1 to
 * 32.
 *
 * $DESCRIPTION$
 * ClearBit() takes the numbers of the bits, so the mask of NumAnd() is not needed.
 *
 * $NOTES$
 * An invalid argument gives -1 and raises no error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * ClearBit( 255, 3, 4, 6 )         OK
 * ClearBit( "FF", 8 )              OK
 * ClearBit( 255, 0 )               OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SetBit(), IsBit(), NumAnd()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'ClearBit( 255, 3, 4, 6 )         ', ClearBit( 255, 3, 4, 6 ), 211 )
   Check( 'ClearBit( "FF", 8 )              ', ClearBit( "FF", 8 ), 127 )
   Check( 'ClearBit( 255, 0 )               ', ClearBit( 255, 0 ), -1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
