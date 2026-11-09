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
 * `EXIT` leaves a DO WHILE or FOR ... NEXT loop and continues after the
 * corresponding ENDDO or NEXT.
 * `LOOP` goes back to the most recently executed DO WHILE or FOR statement.
 *
 * $DESCRIPTION$
 * DO WHILE ... ENDDO executes a block of statements repeatedly, as long as
 * `lCondition` is true (.T.). While the condition is true, control passes
 * into the loop and goes on until EXIT, LOOP or ENDDO. ENDDO returns control
 * to the DO WHILE statement and the process repeats. EXIT continues after the
 * nearest ENDDO or NEXT. LOOP goes back to the nearest DO WHILE or FOR. When
 * the condition is false (.F.), the loop ends and control passes to the
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
 * Odd numbers: 1 3 5 7
 * Steps to reach 1 from 6: 8
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

   LOCAL nNumber := 0
   LOCAL cOdd    := "Odd numbers:"
   LOCAL nValue  := 6
   LOCAL nSteps  := 0
   LOCAL lMore   := .T.

   // LOOP skips even numbers, EXIT ends the loop after 7
   DO WHILE .T.
      nNumber++
      IF nNumber % 2 == 0
         LOOP
      ENDIF
      cOdd += " " + LTrim( Str( nNumber ) )
      IF nNumber >= 7
         EXIT
      ENDIF
   ENDDO
   QOut( cOdd )

   // a repeat-until loop: the condition is checked at the end of each turn
   DO WHILE lMore
      nValue := IIF( nValue % 2 == 0, nValue / 2, nValue * 3 + 1 )
      nSteps++
      lMore := ( nValue != 1 )
   ENDDO
   QOut( "Steps to reach 1 from 6: " + LTrim( Str( nSteps ) ) )

   RETURN
