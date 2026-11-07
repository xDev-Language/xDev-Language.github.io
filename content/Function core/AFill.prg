/*
 * $DOC$
 * $NAME$
 * AFill()
 *
 * $ONELINER$
 * Fill an array with a specified value
 *
 * $SYNTAX$
 * AFill( aTarget, expValue, [nStart], [nCount] ) --> aTarget
 *
 * $ARGUMENTS$
 * aTarget
 * expValue
 * nStart
 * nCount
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

   LOCAL aScores := AFill( Array( 4 ), 0 )
   LOCAL aSeats  := AFill( Array( 5 ), "free" )

   AFill( aSeats, "taken", 2, 2 )

   Check( 'aScores[ 4 ]  ', aScores[ 4 ], 0 )
   Check( 'aSeats[ 1 ]   ', aSeats[ 1 ], "free" )
   Check( 'aSeats[ 3 ]   ', aSeats[ 3 ], "taken" )
   Check( 'aSeats[ 4 ]   ', aSeats[ 4 ], "free" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
