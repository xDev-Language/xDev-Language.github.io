/*
 * $DOC$
 * $NAME$
 * Subtraction assignment (-=)
 *
 * $ONELINER$
 * Apply subtraction to the current value of the target and the right operand.
 *
 * $SYNTAX$
 * target -= value
 *
 * $DESCRIPTION$
 * Apply subtraction to the current value of the target and the right operand. Store the result back in the target. The operand rules are those of -.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nRemaining := 10
   LOCAL nRequest

   FOR EACH nRequest IN { 4, 7, 6 }
      IF nRequest <= nRemaining
         nRemaining -= nRequest
         QOut( "Reserved", nRequest, "remaining", nRemaining )
      ELSE
         QOut( "Short by", nRequest - nRemaining )
      ENDIF
   NEXT

   RETURN
