/*
 * $DOC$
 * $NAME$
 * Exponentiation assignment (^=)
 *
 * $ONELINER$
 * Apply exponentiation to the current value of the target and the right operand.
 *
 * $SYNTAX$
 * target ^= value
 *
 * $DESCRIPTION$
 * Apply exponentiation to the current value of the target and the right operand. Store the result back in the target. The operand rules are those of ^.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSide
   LOCAL nArea

   FOR EACH nSide IN { 3, 5, 8 }
      nArea := nSide
      nArea ^= 2
      QOut( "Tile side in cm", nSide, "area in square cm", nArea )
   NEXT

   RETURN
