/*
 * $DOC$
 * $NAME$
 * Array()
 *
 * $ONELINER$
 * Create an uninitialized array of specified length
 *
 * $SYNTAX$
 * Array( nElements [, nElements...] ) --> aArray
 *
 * $ARGUMENTS$
 * nElements
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
 * Len( aDays )         OK
 * aDays[ 1 ]           OK
 * Len( aBoard[ 1 ] )   OK
 * aBoard[ 2 ][ 2 ]     OK
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

   LOCAL aDays  := Array( 7 )
   LOCAL aBoard := Array( 3, 3 )

   aBoard[ 2 ][ 2 ] := "X"

   Check( 'Len( aDays )         ', Len( aDays ), 7 )
   Check( 'aDays[ 1 ]           ', aDays[ 1 ], NIL )
   Check( 'Len( aBoard[ 1 ] )   ', Len( aBoard[ 1 ] ), 3 )
   Check( 'aBoard[ 2 ][ 2 ]     ', aBoard[ 2 ][ 2 ], "X" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
