/*
 * $DOC$
 * $NAME$
 * EXIT PROCEDURE
 *
 * $ONELINER$
 * Declare an exit procedure
 *
 * $SYNTAX$
 * EXIT PROCEDURE idProcedure
 *    [FIELD idField list [IN idAlias]]
 *    [LOCAL identifier [[:= initializer]]]
 *    .
 *    . executable statements
 *    .
 *    [RETURN]
 *
 * $ARGUMENTS$
 * `EXIT PROCEDURE` declares a procedure that is executed when the program
 * ends.
 * `idProcedure` is the name of the exit procedure. The name can have any
 * length.
 * `FIELD` declares a list of identifiers used as field names. With the IN
 * clause, the name refers to a field of the given alias.
 * `LOCAL` declares and optionally initializes variables or arrays whose
 * visibility and lifetime is the current procedure.
 * `RETURN` passes control to the next exit procedure, or ends the program
 * when no other exit procedures are pending.
 *
 * $DESCRIPTION$
 * EXIT PROCEDURE declares a procedure that is executed when the program
 * ends, after the last executable statement has completed. Exit procedures
 * are used for common housekeeping tasks, such as saving configuration
 * settings, closing a log file or ending a communication session.
 *
 * Exit procedures are visible only to the runtime: a procedure or function
 * cannot call an EXIT PROCEDURE. Exit procedures do not receive parameters.
 * When the program ends, control passes from one exit procedure to the next
 * until all of them have been called.
 *
 * A module that only contains exit procedures is linked into the program by
 * ANNOUNCE in the module and REQUEST in the program. There is no fixed order
 * between the exit procedures of different modules.
 *
 * $NOTES$
 * EXIT PROCEDURE must be written at module level. Calling it, or declaring it
 * with parameters, is a compile error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Main() is working
 * EXIT PROCEDURE: Main() did 3 steps
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ANNOUNCE, REQUEST, INIT PROCEDURE
 *
 * $DOCEND$
 */

STATIC s_nSteps

INIT PROCEDURE StepsStart()

   s_nSteps := 0

   RETURN

PROCEDURE Main()

   LOCAL i

   QOut( "Main() is working" )
   FOR i := 1 TO 3
      s_nSteps++
   NEXT

   RETURN

EXIT PROCEDURE StepsReport()

   QOut( "EXIT PROCEDURE: Main() did " + LTrim( Str( s_nSteps ) ) + " steps" )

   RETURN
