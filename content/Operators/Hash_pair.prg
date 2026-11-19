/*
 * $DOC$
 * $NAME$
 * Hash pair (=>)
 *
 * $ONELINER$
 * Associate a key with its value in a hash literal.
 *
 * $SYNTAX$
 * { key => value [, key => value ...] }
 *
 * $DESCRIPTION$
 * Associate a key with its value in a hash literal. Use { => } for an empty hash.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL hFare := { "adult" => 2400, "child" => 1200 }
   LOCAL hBooking := { "adult" => 2, "child" => 1 }
   LOCAL nTotal := 0
   LOCAL cType

   FOR EACH cType IN { "adult", "child" }
      nTotal += hFare[ cType ] * hBooking[ cType ]
   NEXT
   QOut( "Booking total in cents", nTotal )

   RETURN
