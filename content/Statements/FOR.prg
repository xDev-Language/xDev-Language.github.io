/*
 * $DOC$
 * $NAME$
 * FOR
 *
 * $ONELINER$
 * Execute a block of statements a specified number of times
 *
 * $SYNTAX$
 * FOR idCounter := nStart TO nEnd
 *    [STEP nIncrement]
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
 * negative, `nStart` must be greater than `nEnd`; otherwise `nStart` must be
 * less than `nEnd`.
 * `STEP nIncrement` defines the amount `idCounter` changes in each turn of
 * the loop. It can be positive or negative. Without STEP, `idCounter` grows
 * by one in each turn.
 * `EXIT` leaves the FOR ... NEXT loop and continues after the nearest NEXT.
 * `LOOP` goes back to the most recently executed FOR or DO WHILE statement.
 *
 * $DESCRIPTION$
 * FOR ... NEXT executes a block of statements a specified number of times.
 * The loop goes from the initial value of `idCounter` to the boundary given
 * by `nEnd`, changing the counter by `nIncrement`. The final value and the
 * increment are evaluated again before each turn.
 *
 * The loop runs until `idCounter` is greater than `nEnd`, or until an EXIT
 * statement. Control then goes to the statement after NEXT. LOOP goes back
 * to the current FOR statement.
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
 * Work days: Mon Tue Wed Thu Fri
 * Backwards: Sun Sat Fri Thu Wed Tue Mon
 * Every second day: Mon Wed Fri Sun
 * First weekend day: Sat
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

ENUM WEEKDAY
   MONDAY,
   TUESDAY,
   WEDNESDAY,
   THURSDAY,
   FRIDAY,
   SATURDAY,
   SUNDAY
ENDENUM

PROCEDURE Main()

   LOCAL aDays := { "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" }
   LOCAL nDay
   LOCAL cLine

   // ENUM constants are array subscripts: MONDAY is 1, SUNDAY is 7
   cLine := "Work days:"
   FOR nDay := MONDAY TO FRIDAY
      cLine += " " + aDays[ nDay ]
   NEXT
   QOut( cLine )

   // a negative STEP goes backwards
   cLine := "Backwards:"
   FOR nDay := SUNDAY TO MONDAY STEP -1
      cLine += " " + aDays[ nDay ]
   NEXT nDay
   QOut( cLine )

   cLine := "Every second day:"
   FOR nDay := MONDAY TO SUNDAY STEP 2
      cLine += " " + aDays[ nDay ]
   NEXT
   QOut( cLine )

   // EXIT leaves the loop; the counter keeps its value
   FOR nDay := MONDAY TO SUNDAY
      IF nDay >= SATURDAY
         EXIT
      ENDIF
   NEXT
   QOut( "First weekend day: " + aDays[ nDay ] )

   RETURN
