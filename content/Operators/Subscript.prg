/*
 * $DOC$
 * $NAME$
 * Subscript ([])
 *
 * $ONELINER$
 * Select an array element by its one-based index or a hash entry by its key.
 *
 * $SYNTAX$
 * array[ index ]
 * hash[ key ]
 *
 * $DESCRIPTION$
 * Select an array element by its one-based index or a hash entry by its key. An indexed element can also be the target of an assignment.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aSeats := { { "free", "free" }, { "free", "free" } }
   LOCAL nRow := 2
   LOCAL nSeat := 1

   IF aSeats[ nRow ][ nSeat ] == "free"
      aSeats[ nRow ][ nSeat ] := "Ada"
   ENDIF
   QOut( "Passenger", aSeats[ nRow ][ nSeat ] )
   QOut( "Adjacent seat", aSeats[ nRow ][ nSeat + 1 ] )

   RETURN
