/*
 * $DOC$
 * $NAME$
 * Increment (++)
 *
 * $ONELINER$
 * Add one to the target.
 *
 * $SYNTAX$
 * ++target
 * target++
 *
 * $DESCRIPTION$
 * Add one to the target. The prefix form yields the updated value. The postfix form yields the previous value. Both forms update the target.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nNextTicket := 100
   LOCAL nServed := 0
   LOCAL cName

   FOR EACH cName IN { "Ada", "Jan" }
      QOut( cName, "ticket", nNextTicket++ )
      QOut( "Customers served", ++nServed )
   NEXT
   QOut( "Next available ticket", nNextTicket )

   RETURN
