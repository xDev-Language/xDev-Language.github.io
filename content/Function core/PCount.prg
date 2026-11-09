/*
 * $DOC$
 *
 * $NAME$
 * PCount()
 *
 * $ONELINER$
 * Return the number of arguments passed to the current routine
 *
 * $SYNTAX$
 * PCount() --> nArguments
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * An integer giving the actual number of arguments passed in this call.
 *
 * $DESCRIPTION$
 * Counts the arguments supplied by the caller, rather than the parameters
 * declared in the routine header. An explicitly passed NIL counts as an
 * argument. A declared parameter for which the caller supplies no argument
 * does not increase the count.
 * The call takes no arguments and is handled directly by the compiler.
 *
 * $NOTES$
 * The example prints 0, 1 and 3.
 *
 * Deliberately invalid example: PCount( 1 ).
 * Expected result: a compilation error, not a runtime value.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * 0
 * 1
 * 3
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ProcName(), ProcLine()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( s_Count() )
   QOut( s_Count( "first" ) )
   QOut( s_Count( "first", NIL, 3 ) )

RETURN

STATIC FUNCTION s_Count( xFirst, xSecond, xThird )

RETURN PCount()
