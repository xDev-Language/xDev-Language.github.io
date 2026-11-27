/*
 * $DOC$
 *
 * $NAME$
 * Unused()
 *
 * $ONELINER$
 * Mark variables and parameters that are not used on purpose
 *
 * $SYNTAX$
 * Unused( <var> [, <var> ...] ) --> NIL
 *
 * $ARGUMENTS$
 * <var> is the name of a LOCAL, a STATIC or a parameter of the routine.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * The compiler warns about a variable or a parameter whose value is never
 * read. Unused() tells it that this is on purpose, for example for a
 * parameter that a callback receives but does not need, and the warning
 * goes away. The parameters of methods are not checked: their number is
 * fixed by the declaration of the class.
 * The call is handled directly by the compiler and makes no code.
 * The option -Wno-unused turns all these warnings off.
 *
 * $NOTES$
 * The example prints 42; without Unused( cNote ) the compiler warns that
 * the parameter cNote is not used.
 *
 * Deliberately invalid examples: Unused(), Unused( 1 ), Unused( @nValue ).
 * Expected result: a compilation error.
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
 * PCount(), ProcName(), ProcLine()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( s_Twice( 21, "not needed" ) )

RETURN

STATIC FUNCTION s_Twice( nValue, cNote )

   Unused( cNote )

RETURN nValue * 2
