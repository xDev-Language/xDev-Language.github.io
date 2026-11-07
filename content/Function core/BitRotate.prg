/*
 * $DOC$
 * $NAME$
 * BitRotate()
 *
 * $ONELINER$
 * Rotate the bits of an integer; a positive nRotate rotates to the left, a negative one to the right
 *
 * $SYNTAX$
 * BitRotate( nInteger, nRotate, [nBits] ) --> nResult
 *
 * $ARGUMENTS$
 * nInteger
 * nRotate
 * nBits
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'BitRotate( 1, 3 )                       ', BitRotate( 1, 3 ), 8 )
   Check( 'BitRotate( 8, -3 )                      ', BitRotate( 8, -3 ), 1 )
   Check( 'BitRotate( 1, -1 ) == BitShift( 1, 63 ) ', BitRotate( 1, -1 ) == BitShift( 1, 63 ), .T. )
   Check( 'BitRotate( 255, 2 )                     ', BitRotate( 255, 2 ), 1020 )
   Check( 'BitRotate( 255, -2 )                    ', BitRotate( 255, -2 ), -4611686018427387841 )
   Check( 'BitRotate( 10352, 3, 16 )               ', BitRotate( 10352, 3, 16 ), 17281 )
   Check( 'BitRotate( 10352, 3, 8 )                ', BitRotate( 10352, 3, 8 ), 10371 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
