/*
 * $DOC$
 * $NAME$
 * ASort()
 *
 * $ONELINER$
 * Sort an array
 *
 * $SYNTAX$
 * ASort( aTarget, [nStart], [nCount], [bOrder] ) --> aTarget
 *
 * $ARGUMENTS$
 * aTarget
 * nStart
 * nCount
 * bOrder
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

   LOCAL aNumbers := { 5, 2, 9, 1 }
   LOCAL aPeople  := { { "Jan", 34 }, { "Anna", 28 }, { "Ewa", 41 } }

   ASort( aNumbers )
   Check( 'aNumbers[ 1 ] after ASort( aNumbers )        ', aNumbers[ 1 ], 1 )

   ASort( aNumbers, , , {| x, y | x > y } )
   Check( 'aNumbers[ 1 ] after sorting downwards        ', aNumbers[ 1 ], 9 )

   ASort( aPeople, , , {| x, y | x[ 2 ] < y[ 2 ] } )
   Check( 'aPeople[ 1 ][ 1 ] after sorting by age       ', aPeople[ 1 ][ 1 ], "Anna" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
