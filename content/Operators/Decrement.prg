/*
 * $DOC$
 * $NAME$
 * Decrement (--)
 *
 * $ONELINER$
 * Subtract one from the target.
 *
 * $SYNTAX$
 * --target
 * target--
 *
 * $DESCRIPTION$
 * Subtract one from the target. The prefix form yields the updated value. The postfix form yields the previous value. Both forms update the target.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSeats := 2
   LOCAL cName

   FOR EACH cName IN { "Ada", "Jan", "Mira" }
      IF nSeats > 0
         QOut( cName, "seat number", nSeats-- )
      ELSE
         QOut( cName, "waiting list" )
      ENDIF
   NEXT

   RETURN
