/*
 * $DOC$
 * $NAME$
 * FOR
 *
 * $ONELINER$
 * Execute a block of statements a specified number of times
 *
 * $SYNTAX$
 * FOR idCounter := nStart TO nEnd [STEP nIncrement]
 *    statements...
 *    [EXIT]
 *    statements...
 *    [LOOP]
 * NEXT [idCounter]
 *
 * $ARGUMENTS$
 * `idCounter` is the name of the loop control or counter variable. It must
 * be a declared variable.
 * `nStart` is the initial value assigned to `idCounter`.
 * `TO nEnd` defines the final value of `idCounter`. If `nIncrement` is
 * negative, the body runs while the counter is at least `nEnd`. Otherwise
 * it runs while the counter is at most `nEnd`.
 * `STEP nIncrement` defines the amount `idCounter` changes in each turn of
 * the loop. It can be positive or negative. Without STEP, `idCounter` grows
 * by one in each turn.
 * `EXIT` leaves the FOR ... NEXT loop and continues after the nearest NEXT.
 * `LOOP` skips the rest of the body and applies the step.
 *
 * $DESCRIPTION$
 * FOR ... NEXT executes a block of statements a specified number of times.
 * The loop goes from the initial value of `idCounter` to the boundary given
 * by `nEnd`, changing the counter by `nIncrement`. The final value and the
 * increment are evaluated again before each turn.
 *
 * The loop runs until `idCounter` is greater than `nEnd`, or until an EXIT
 * statement. Control then goes to the statement after NEXT. LOOP applies
 * the step and checks the limit again.
 *
 * With a negative `nIncrement`, `idCounter` decreases, and the loop runs
 * until `idCounter` is less than `nEnd`.
 *
 * FOR loops are useful for going through arrays, with `idCounter` used as
 * the array subscript. Constants of an ENUM start at 1, like array
 * subscripts, so they can be used directly as the boundaries of the loop.
 *
 * FOR ... NEXT loops can be nested in any other control structures to any
 * depth, as long as each structure is properly nested.
 *
 * $NOTES$
 * The name after NEXT is optional; when given, it must be the name of the
 * counter of the same loop. After EXIT the counter keeps its last value.
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
 * AEval(), BEGIN SEQUENCE, DO CASE, DO WHILE, ENUM, FOR EACH, IF
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aStock := { 3, 8, 2, 4 }
   LOCAL nNeed := 10
   LOCAL nBin
   LOCAL nTake

   // Consume the newest bins first. Each index identifies the bin to update.
   FOR nBin := Len( aStock ) TO 1 STEP -1
      nTake := aStock[ nBin ]
      IF nTake > nNeed
         nTake := nNeed
      ENDIF
      aStock[ nBin ] -= nTake
      nNeed -= nTake
      QOut( "Bin", nBin, "picked", nTake, "remaining", aStock[ nBin ] )
      IF nNeed == 0
         EXIT
      ENDIF
   NEXT

   RETURN
