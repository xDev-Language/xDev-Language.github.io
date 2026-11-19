/*
 * $DOC$
 * $NAME$
 * DO WHILE
 *
 * $ONELINER$
 * Execute a loop while a condition is true (.T.)
 *
 * $SYNTAX$
 * DO WHILE lCondition
 *    statements...
 *    [EXIT]
 *    statements...
 *    [LOOP]
 *    statements...
 * ENDDO
 *
 * $ARGUMENTS$
 * `lCondition` is the logical control expression of the loop.
 * `EXIT` leaves the innermost enclosing loop or SWITCH.
 * `LOOP` skips the rest of the current iteration.
 *
 * $DESCRIPTION$
 * DO WHILE ... ENDDO executes a block of statements repeatedly, as long as
 * `lCondition` is true (.T.). While the condition is true, control passes
 * into the loop and goes on until EXIT, LOOP or ENDDO. ENDDO returns control
 * to the condition and the process repeats. Within this loop, LOOP also
 * returns to the condition. When the condition is false (.F.), control passes to the
 * statement after ENDDO.
 *
 * Use EXIT to end a loop on a condition other than the DO WHILE condition.
 * LOOP skips the rest of the statements based on an intermediate condition
 * and returns to the most recent DO WHILE.
 *
 * DO WHILE loops can be nested in any other control structures to any depth,
 * as long as each structure is properly nested.
 *
 * $NOTES$
 * The loop starts with DO WHILE and ends only with ENDDO. LOOP outside a loop
 * is a compile error; EXIT outside a loop is allowed only inside SWITCH.
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
 * BEGIN SEQUENCE, DbEval(), DO CASE, FOR, IF, RETURN
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nDue
   LOCAL nBalance
   LOCAL nWeek

   FOR EACH nDue IN { 0, 65, 140 }
      nBalance := nDue
      nWeek := 0
      DO WHILE nBalance > 0
         nWeek++
         IF nBalance <= 50
            QOut( "Final payment", nBalance )
            nBalance := 0
         ELSE
            nBalance -= 50
         ENDIF
      ENDDO
      QOut( "Starting balance", nDue, "weeks to clear", nWeek )
   NEXT

   RETURN
