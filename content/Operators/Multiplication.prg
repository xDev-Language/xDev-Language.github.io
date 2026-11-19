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
