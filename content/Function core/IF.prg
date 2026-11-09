/*
 * $DOC$
 *
 * $NAME$
 * IF()
 *
 * $ONELINER$
 * Return one of two values according to a logical condition
 *
 * $SYNTAX$
 * IF( lCondition, expTrue, expFalse ) --> xValue
 *
 * $ARGUMENTS$
 * `lCondition`: a logical expression, .T. or .F.
 * `expTrue`: the expression to evaluate when the condition is .T.
 * `expFalse`: the expression to evaluate when the condition is .F.
 *
 * $RETURNS$
 * The value of the selected expression.
 *
 * $DESCRIPTION$
 * Evaluates the condition and then evaluates only the selected expression.
 * The other expression is not executed. This allows a branch to guard an
 * operation such as division by zero. The condition must be logical;
 * numbers and strings are not implicitly converted to logical values.
 * All three expressions are required. Both branches must be valid source
 * code and are subject to compile-time type checks, even when not selected.
 *
 * $NOTES$
 * IF() and IIF() have the same behavior in xDev. They are compiled directly
 * as conditional expressions. With explicitly declared types, the compiler
 * checks the result types of both branches and applies its common-type rules.
 * The example prints "yes", "no" and .T. The division is not executed.
 *
 * Deliberately invalid examples: IF( 1, "yes", "no" ) and IF( .T., 1 ).
 * Expected result: a compilation error, not a runtime value.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * yes
 * no
 * .T.
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * IIF()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nDivisor := 0
   LOCAL nResult

   QOut( IF( .T., "yes", "no" ) )
   QOut( IF( .F., "yes", "no" ) )

   nResult := IF( nDivisor != 0, 10 / nDivisor, 0 )
   QOut( nResult == 0 )

RETURN
