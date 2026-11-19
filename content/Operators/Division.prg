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
