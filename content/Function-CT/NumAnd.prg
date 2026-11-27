/*
 * $DOC$
 * $NAME$
 * NumAnd()
 *
 * $ONELINER$
 * Join numbers with a bitwise AND
 *
 * $SYNTAX$
 * NumAnd( nWord1 | cHexWord1, nWord2 | cHexWord2, [nWordN | cHexWordN, ...] ) --> nWordAnd
 *
 * $ARGUMENTS$
 * `nWord1 | cHexWord1`, `nWord2 | cHexWord2`, ... Numbers, or the same numbers as strings of hex
 * digits, for example "FF".
 *
 * $RETURNS$
 * All arguments joined with AND. -1 when an argument is invalid.
 *
 * $DESCRIPTION$
 * A bit of the result is 1 only when it is 1 in every argument. Use NumAnd() with a mask to keep
 * some bits and reset the others to 0.
 *
 * $NOTES$
 * An invalid argument, for example a logical value or "GG", gives -1 and raises no error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * NumAnd( 29, 7 )                  OK
 * NumAnd( "FF", "0F", 6 )          OK
 * NumAnd( 29, "GG" )               OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * NumOr(), NumXor(), NumNot(), ClearBit()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   /* 00011101 AND 00000111 = 00000101 */
   Check( 'NumAnd( 29, 7 )                  ', NumAnd( 29, 7 ), 5 )
   Check( 'NumAnd( "FF", "0F", 6 )          ', NumAnd( "FF", "0F", 6 ), 6 )
   Check( 'NumAnd( 29, "GG" )               ', NumAnd( 29, "GG" ), -1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
