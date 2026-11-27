/*
 * $DOC$
 * $NAME$
 * Remainder assignment (%=)
 *
 * $ONELINER$
 * Apply remainder to the current value of the target and the right operand.
 *
 * $SYNTAX$
 * target %= value
 *
 * $DESCRIPTION$
 * Apply remainder to the current value of the target and the right operand. Store the result back in the target. The operand rules are those of %.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nMinute := 23 * 60 + 45
   LOCAL nDelay := 35

   nMinute += nDelay
   nMinute %= 24 * 60
   QOut( "Arrival hour", Int( nMinute / 60 ), "minute", nMinute % 60 )

   RETURN
