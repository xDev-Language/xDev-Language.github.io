/*
 * $DOC$
 * $NAME$
 * Division (/)
 *
 * $ONELINER$
 * Divide the left operand by the right operand.
 *
 * $SYNTAX$
 * left / right
 *
 * $DESCRIPTION$
 * Divide the left operand by the right operand. A zero divisor raises an error.
 *
 * The result is a fraction, also for two integers: 7 / 2 is 3.5. With typed numbers it is FLOAT64.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nDistance := 135
   LOCAL nMinutes

   FOR EACH nMinutes IN { 90, 120, 0 }
      IF nMinutes > 0
         QOut( "Average km/h", nDistance / ( nMinutes / 60 ) )
      ELSE
         QOut( "Elapsed time required" )
      ENDIF
   NEXT

   RETURN
