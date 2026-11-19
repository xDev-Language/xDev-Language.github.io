/*
 * $DOC$
 * $NAME$
 * SWITCH
 *
 * $ONELINER$
 * Select a starting block by matching a literal
 *
 * $SYNTAX$
 * SWITCH exp
 * [CASE literal
 *    statements...]
 * [OTHERWISE
 *    statements...]
 * ENDSWITCH
 *
 * $ARGUMENTS$
 * exp is the selector. Each CASE label is a unique integer, string or NIL
 * literal. An integer label may have a leading sign and must lie between
 * -9007199254740991 and 9007199254740991.
 *
 * $DESCRIPTION$
 * Execution starts at the matching CASE and proceeds through following blocks
 * until EXIT, RETURN or the end of SWITCH. This includes OTHERWISE when
 * execution reaches it from a CASE. If no label matches, execution starts at
 * OTHERWISE if present.
 *
 * $NOTES$
 * END is also accepted as the closing keyword.
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
 * DO CASE, IF, EXIT
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cEvent
   LOCAL nBalance := 0

   FOR EACH cEvent IN { "deposit", "refund", "sale", "audit", "hold" }
      SWITCH cEvent
      CASE "deposit"
      CASE "refund"
         // Both labels enter the same credit branch.
         nBalance += 10
         EXIT
      CASE "sale"
         nBalance -= 5
         EXIT
      CASE "audit"
         QOut( "Audit balance", nBalance )
         EXIT
      OTHERWISE
         QOut( "Unknown event", cEvent )
      ENDSWITCH
   NEXT
   QOut( "Closing balance", nBalance )

   RETURN
