/*
 * $DOC$
 * $NAME$
 * Unary sign (+ or -)
 *
 * $ONELINER$
 * Unary plus preserves the numeric value.
 *
 * $SYNTAX$
 * +value
 * -value
 *
 * $DESCRIPTION$
 * Unary plus preserves the numeric value. Unary minus changes its sign. Parentheses make the intended operand explicit.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nChange
   LOCAL nBalance := 40

   FOR EACH nChange IN { +12, -5, -3 }
      nBalance += nChange
      QOut( "Posted", nChange, "reversal", -nChange, "balance", nBalance )
   NEXT

   RETURN
