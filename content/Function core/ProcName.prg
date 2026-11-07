/*
 * $DOC$
 *
 * $NAME$
 * ProcName()
 *
 * $ONELINER$
 * Return the name of the current procedure or function
 *
 * $SYNTAX$
 * ProcName() --> cName
 *
 * $ARGUMENTS$
 * None in the current implementation.
 *
 * $RETURNS$
 * The current routine name as an uppercase string.
 *
 * $DESCRIPTION$
 * Returns the name of the routine containing this call. The compiler supplies
 * the name; the function does not inspect a runtime call stack.
 *
 * $NOTES$
 * Only the argument-free form is supported. Passing any argument, including
 * 0, is a compile-time error. Looking up a caller by stack level is not
 * implemented. The example prints "MAIN" and "S_SHOWNAME".
 *
 * Deliberately invalid examples: ProcName( 0 ) and ProcName( 1 ).
 * Expected result: a compilation error, not a runtime value.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ProcLine(), PCount()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( ProcName() )
   s_ShowName()

RETURN

STATIC PROCEDURE s_ShowName()

   QOut( ProcName() )

RETURN
