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
 * A minus before a number literal is a constant of the type of the literal: -1 is INT64 and -1.5 is FLOAT64. A minus before a value of a typed variable keeps its type; INT8, INT16 and their unsigned forms are computed as INT32. A minus before an integer without a type gives a value without a type, because the result may leave the INT64 range.
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
