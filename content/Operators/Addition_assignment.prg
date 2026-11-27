/*
 * $DOC$
 * $NAME$
 * Addition assignment (+=)
 *
 * $ONELINER$
 * Apply addition to the current value of the target and the right operand.
 *
 * $SYNTAX$
 * target += value
 *
 * $DESCRIPTION$
 * Apply addition to the current value of the target and the right operand. Store the result back in the target. The operand rules are those of +.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nDelta
   LOCAL nStock := 20
   LOCAL cLog := "Stock"

   FOR EACH nDelta IN { 8, -3, -2 }
      nStock += nDelta
      cLog += " -> " + LTrim( Str( nStock ) )
   NEXT
   QOut( cLog )

   RETURN
