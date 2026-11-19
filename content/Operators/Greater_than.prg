/*
 * $DOC$
 * $NAME$
 * Greater than (>)
 *
 * $ONELINER$
 * Return true when the left operand sorts after the right operand.
 *
 * $SYNTAX$
 * left > right
 *
 * $DESCRIPTION$
 * Return true when the left operand sorts after the right operand.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nMinutes
   LOCAL nLimit := 15

   FOR EACH nMinutes IN { 12, 15, 19 }
      IF nMinutes > nLimit
         QOut( nMinutes, "Late delivery" )
      ELSE
         QOut( nMinutes, "On time" )
      ENDIF
   NEXT

   RETURN
