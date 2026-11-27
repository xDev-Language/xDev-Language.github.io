/*
 * $DOC$
 * $NAME$
 * Multiplication (*)
 *
 * $ONELINER$
 * Multiply two numeric operands.
 *
 * $SYNTAX$
 * left * right
 *
 * $DESCRIPTION$
 * Multiply two numeric operands.
 *
 * With typed numbers an integer and a fraction give the type of the fraction: FLOAT32 with any integer gives FLOAT32, FLOAT64 gives FLOAT64. An overflow of a typed result is a runtime error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nCentsPerUnit := 175
   LOCAL nQuantity

   // A return reverses the charge at the same unit price.
   FOR EACH nQuantity IN { 4, 0, -2 }
      QOut( "Quantity", nQuantity, "line amount in cents", nQuantity * nCentsPerUnit )
   NEXT

   RETURN
