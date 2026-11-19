/*
 * $DOC$
 * $NAME$
 * LOCAL
 *
 * $ONELINER$
 * Declare a variable belonging to the current routine
 *
 * $SYNTAX$
 * LOCAL idVar [AS type] [:= exp] [, ...]
 * LOCAL idArray[ nSize [, nSize2 ...] ] [, ...]
 *
 * $ARGUMENTS$
 * AS supplies a type. An untyped variable has type ANY.
 * An initializer supplies the starting value. Brackets declare array
 * dimensions.
 *
 * $DESCRIPTION$
 * A local name belongs to the routine where it is declared. Each invocation
 * has its own local variables. An initializer is evaluated when execution
 * reaches the declaration. Declare an array with dimensions or initialize
 * a variable with an array expression.
 *
 * $NOTES$
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
 * STATIC, FIELD, FUNCTION, PROCEDURE
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aOrders := { { 4, 7 }, { 1, 2, 3 }, {} }
   LOCAL aOrder

   FOR EACH aOrder IN aOrders
      QOut( "Order subtotal", Subtotal( aOrder ) )
   NEXT

   RETURN

STATIC FUNCTION Subtotal( aLines )

   // Each invocation starts at zero, including the empty order.
   LOCAL nTotal := 0
   LOCAL nLine

   FOR EACH nLine IN aLines
      nTotal += nLine
   NEXT

   RETURN nTotal
