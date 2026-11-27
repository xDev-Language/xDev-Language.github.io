/*
 * $DOC$
 * $NAME$
 * NumOr()
 *
 * $ONELINER$
 * Join numbers with a bitwise OR
 *
 * $SYNTAX$
 * NumOr( nWord1 | cHexWord1, nWord2 | cHexWord2, [nWordN | cHexWordN, ...] ) --> nWordOr
 *
 * $ARGUMENTS$
 * `nWord1 | cHexWord1`, `nWord2 | cHexWord2`, ... Numbers, or the same numbers as strings of hex
 * digits, for example "10".
 *
 * $RETURNS$
 * All arguments joined with OR. -1 when an argument is invalid.
 *
 * $DESCRIPTION$
 * A bit of the result is 1 when it is 1 in any argument. Use NumOr() to set some bits and keep the
 * others.
 *
 * $NOTES$
 * An invalid argument gives -1 and raises no error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * NumOr( 3, 16 )                   OK
 * NumOr( 1, 2, "4" )               OK
 * NumOr( 3, .T. )                  OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * NumAnd(), NumXor(), NumNot(), SetBit()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   /* 00000011 OR 00010000 = 00010011 */
   Check( 'NumOr( 3, 16 )                   ', NumOr( 3, 16 ), 19 )
   Check( 'NumOr( 1, 2, "4" )               ', NumOr( 1, 2, "4" ), 7 )
   Check( 'NumOr( 3, .T. )                  ', NumOr( 3, .T. ), -1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
