/*
 * $DOC$
 *
 * $NAME$
 * ProcLine()
 *
 * $ONELINER$
 * Return the source line number of the current call
 *
 * $SYNTAX$
 * ProcLine() --> nLine
 *
 * $ARGUMENTS$
 * None in the current implementation.
 *
 * $RETURNS$
 * An integer containing the source line number recorded for this call.
 *
 * $DESCRIPTION$
 * Returns the source line containing the ProcLine() expression. The compiler
 * embeds this number in the program; no runtime call-stack lookup is needed.
 * Moving the expression to another source line changes the returned number
 * when the program is compiled again.
 *
 * $NOTES$
 * Only the argument-free form is supported. Passing any argument, including
 * 0, is a compile-time error. Looking up a caller by stack level is not
 * implemented. The example prints the line number and then .T.
 *
 * Deliberately invalid examples: ProcLine( 0 ) and ProcLine( 1 ).
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
 * ProcName(), PCount()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nLine := ProcLine()

   QOut( nLine )
   QOut( nLine > 0 )

RETURN
