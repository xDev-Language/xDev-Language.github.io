/*
 * $DOC$
 *
 * $NAME$
 * ProcLine()
 *
 * $ONELINER$
 * Return the source line number of a call in the call stack
 *
 * $SYNTAX$
 * ProcLine( [nLevel] ) --> nLine
 *
 * $ARGUMENTS$
 * `nLevel` is the number of steps up the call stack. 0, the default, is the
 * current routine, 1 is the routine that called it, and so on.
 *
 * $RETURNS$
 * An integer with the source line of the call that the routine makes, or 0
 * when `nLevel` is above the first routine of the program.
 *
 * $DESCRIPTION$
 * Without an argument, the compiler embeds the line of the ProcLine()
 * expression. With `nLevel`, the line is read from the call stack at run
 * time: for level 1 it is the line where the caller called the current
 * routine.
 *
 * $NOTES$
 * The example prints the line number and then .T.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * 50
 * .T.
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ProcName(), PCount()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nLine := ProcLine()

   QOut( nLine )
   QOut( nLine > 0 )

RETURN
