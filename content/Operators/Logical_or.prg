/*
 * $DOC$
 * $NAME$
 * Logical or (.OR.)
 *
 * $ONELINER$
 * Return true when either logical operand is true.
 *
 * $SYNTAX$
 * left .OR. right
 *
 * $DESCRIPTION$
 * Return true when either logical operand is true. A true left operand skips evaluation of the right operand.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aSamples := { 12, NIL, -1, 0 }
   LOCAL xSample

   FOR EACH xSample IN aSamples
      IF xSample == NIL .OR. xSample < 0
         QOut( "Missing or invalid reading" )
      ELSE
         QOut( "Accepted reading", xSample )
      ENDIF
   NEXT

   RETURN
