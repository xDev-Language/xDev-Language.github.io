/*
 * $DOC$
 * $NAME$
 * Multiplication assignment (*=)
 *
 * $ONELINER$
 * Apply multiplication to the current value of the target and the right operand.
 *
 * $SYNTAX$
 * target *= value
 *
 * $DESCRIPTION$
 * Apply multiplication to the current value of the target and the right operand. Store the result back in the target. The operand rules are those of *.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nUnits := 1
   LOCAL nFactor

   // Pieces per tray, trays per carton, cartons per pallet.
   FOR EACH nFactor IN { 6, 4, 15 }
      nUnits *= nFactor
      QOut( "Pieces in this packing unit", nUnits )
   NEXT

   RETURN
