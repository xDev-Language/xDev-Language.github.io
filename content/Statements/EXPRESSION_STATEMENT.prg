/*
 * $DOC$
 * $NAME$
 * Expression statement
 *
 * $ONELINER$
 * Execute an assignment, update, call or message as a statement
 *
 * $SYNTAX$
 * target := exp
 * target += exp
 * target -= exp
 * target *= exp
 * target /= exp
 * target %= exp
 * target ^= exp
 * target++
 * target--
 * idRoutine( [exp1 [, exp2 ...]] )
 * oObject:idMessage( [exp1 [, exp2 ...]] )
 *
 * $ARGUMENTS$
 * target is a writable location, such as a variable or an array element.
 * exp supplies the assigned value, update operand or call argument.
 *
 * $DESCRIPTION$
 * An expression statement executes for its effect and discards the
 * expression's result. In xDev's xBase syntax, an ordinary assignment
 * uses :=. A compound assignment combines the target's current value
 * with exp and stores the result. The ++ and -- operators change a
 * value by one.
 *
 * A call can stand alone when the caller only needs its effect.
 * Use an assignment when the result is needed later.
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
 * LOCAL, STATIC, FUNCTION, METHOD
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aLog := {}
   LOCAL nBalance := 20

   PostEntry( aLog, "delivery", 8 )
   nBalance += aLog[ 1 ][ 2 ]
   PostEntry( aLog, "sale", -3 )
   nBalance += aLog[ 2 ][ 2 ]
   QOut( "Movements recorded", Len( aLog ), "closing stock", nBalance )

   RETURN

STATIC PROCEDURE PostEntry( aLog, cReason, nUnits )

   // AAdd changes the log. This call discards its return value.
   AAdd( aLog, { cReason, nUnits } )

   RETURN
