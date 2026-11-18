/*
 * $DOC$
 * $NAME$
 * NumNot()
 *
 * $ONELINER$
 * Return the 16-bit complement of a number
 *
 * $SYNTAX$
 * NumNot( nWord | cHexWord ) --> nNegatedWord
 *
 * $ARGUMENTS$
 * `nWord | cHexWord` A number, or the same number as a string of hex digits.
 *
 * $RETURNS$
 * The 16-bit one's complement: each 0 bit becomes 1 and each 1 bit becomes 0. -1 when the argument
 * is invalid.
 *
 * $DESCRIPTION$
 * NumNot() works on 16 bits, so the result is from 0 to 65535. Use it with NumAnd() to clear the
 * bits of a mask.
 *
 * $NOTES$
 * An invalid argument gives -1 and raises no error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * NumNot( 5 )                      OK
 * NumNot( "FFFF" )                 OK
 * NumNot( NumNot( 1234 ) )         OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * NumAnd(), NumOr(), NumXor()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   /* 00000000 00000101 becomes 11111111 11111010 */
   Check( 'NumNot( 5 )                      ', NumNot( 5 ), 65530 )
   Check( 'NumNot( "FFFF" )                 ', NumNot( "FFFF" ), 0 )
   Check( 'NumNot( NumNot( 1234 ) )         ', NumNot( NumNot( 1234 ) ), 1234 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
