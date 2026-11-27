/*
 * $DOC$
 * $NAME$
 * NumXor()
 *
 * $ONELINER$
 * Join numbers with a bitwise exclusive OR
 *
 * $SYNTAX$
 * NumXor( nWord1 | cHexWord1, nWord2 | cHexWord2 ) --> nWordXor
 *
 * $ARGUMENTS$
 * `nWord1 | cHexWord1`, `nWord2 | cHexWord2` Numbers, or the same numbers as strings of hex
 * digits.
 *
 * $RETURNS$
 * The arguments joined with exclusive OR. -1 when an argument is invalid.
 *
 * $DESCRIPTION$
 * A bit of the result is 1 when it differs in the two arguments. The same NumXor() twice gives
 * the first number back, so it can encode and decode small numbers.
 *
 * $NOTES$
 * An invalid argument gives -1 and raises no error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * NumXor( 3, 5 )                   OK
 * NumXor( NumXor( 1234, 9 ), 9 )   OK
 * NumXor( "F0", "FF" )             OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * NumAnd(), NumOr(), NumNot()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   /* 00000011 XOR 00000101 = 00000110 */
   Check( 'NumXor( 3, 5 )                   ', NumXor( 3, 5 ), 6 )
   Check( 'NumXor( NumXor( 1234, 9 ), 9 )   ', NumXor( NumXor( 1234, 9 ), 9 ), 1234 )
   Check( 'NumXor( "F0", "FF" )             ', NumXor( "F0", "FF" ), 15 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
