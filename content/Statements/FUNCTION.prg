/*
 * $DOC$
 * $NAME$
 * FUNCTION
 *
 * $ONELINER$
 * Declare a routine that returns a value
 *
 * $SYNTAX$
 * [STATIC] FUNCTION idFunction( [idParam [AS type] [, ...]] ) [AS resultType]
 *    statements...
 *    RETURN exp
 *
 * $ARGUMENTS$
 * Parameters without AS have type ANY. AS resultType declares the result type.
 * STATIC limits visibility to the current source file.
 *
 * $DESCRIPTION$
 * Declare a function at module level. Call it by name with parentheses.
 * A function must contain a RETURN with an expression. Supply a return value
 * for each path through the function.
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
 * PROCEDURE, RETURN, STATIC
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nUnits
   LOCAL nCost := 0

   FOR EACH nUnits IN { 0, 12, 13, 24 }
      nCost += CartonsNeeded( nUnits, 12 ) * 75
      QOut( "Order size", nUnits, "cartons", CartonsNeeded( nUnits, 12 ) )
   NEXT
   QOut( "Packing cost in cents", nCost )

   RETURN

STATIC FUNCTION CartonsNeeded( nUnits AS INT, nCapacity AS INT ) AS INT

   LOCAL nFull AS INT := CAST( nUnits / nCapacity AS INT )

   IF nUnits % nCapacity != 0
      RETURN nFull + 1
   ENDIF

   RETURN nFull
