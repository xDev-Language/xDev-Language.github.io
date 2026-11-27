/*
 * $DOC$
 *
 * $NAME$
 * ProcName()
 *
 * $ONELINER$
 * Return the name of a procedure or function in the call stack
 *
 * $SYNTAX$
 * ProcName( [nLevel] ) --> cName
 *
 * $ARGUMENTS$
 * `nLevel` is the number of steps up the call stack. 0, the default, is the
 * current routine, 1 is the routine that called it, and so on.
 *
 * $RETURNS$
 * The routine name as an uppercase string, or "" when `nLevel` is above the
 * first routine of the program.
 *
 * $DESCRIPTION$
 * Without an argument, the compiler supplies the name of the routine that
 * contains the call. With `nLevel`, the name is read from the call stack at
 * run time. A method is named CLASS:METHOD.
 *
 * $NOTES$
 * The example prints "MAIN" and "S_SHOWNAME".
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * MAIN
 * S_SHOWNAME
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
