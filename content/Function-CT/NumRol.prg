/*
 * $DOC$
 * $NAME$
 * NumRol()
 *
 * $ONELINER$
 * Rotate the bits of a 16-bit value to the left
 *
 * $SYNTAX$
 * NumRol( nWord | cHexWord, nCount | cHexCount, [lLowByte] ) --> nWordRotated
 *
 * $ARGUMENTS$
 * `nWord | cHexWord` A value from 0 to 65535, or the same value as a string of hex digits.
 *
 * `nCount | cHexCount` The number of rotations, from 0 to 65535. Only the remainder of the division
 * by 16 counts, or by 8 with `lLowByte`.
 *
 * `lLowByte` .T. rotates only the low byte; the high byte stays. The default is .F., all 16 bits.
 *
 * $RETURNS$
 * The rotated value. -1 when an argument is invalid or outside 0 to 65535.
 *
 * $DESCRIPTION$
 * A bit that leaves on the left comes back on the right. A rotation to the right by n is a
 * rotation to the left by 16 - n, or 8 - n with `lLowByte`.
 *
 * $NOTES$
 * An invalid argument gives -1 and raises no error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * NumRol( 1, 3 )                   OK
 * NumRol( 4, 14 ), 2 to the right  OK
 * NumRol( 1, 33 )                  OK
 * NumRol( 60000, 2, .T. )          OK
 * NumRol( 70000, 1 )               OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * NumMirr(), NumAnd(), NumOr()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'NumRol( 1, 3 )                   ', NumRol( 1, 3 ), 8 )
   Check( 'NumRol( 4, 14 ), 2 to the right  ', NumRol( 4, 14 ), 1 )
   Check( 'NumRol( 1, 33 )                  ', NumRol( 1, 33 ), 2 )

   /* 11101010 01100000 becomes 11101010 10000001 */
   Check( 'NumRol( 60000, 2, .T. )          ', NumRol( 60000, 2, .T. ), 60033 )
   Check( 'NumRol( 70000, 1 )               ', NumRol( 70000, 1 ), -1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
