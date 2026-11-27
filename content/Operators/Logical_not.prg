/*
 * $DOC$
 * $NAME$
 * Logical not (.NOT. or !)
 *
 * $ONELINER$
 * Reverse the value of a logical expression.
 *
 * $SYNTAX$
 * .NOT. condition
 * !condition
 *
 * $DESCRIPTION$
 * Reverse the value of a logical expression. Both spellings accept the same operand.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cDay
   LOCAL lClosed

   FOR EACH cDay IN { "Fri", "Sat", "Sun", "Mon" }
      lClosed := cDay == "Sat" .OR. cDay == "Sun"
      IF .NOT. lClosed
         QOut( "Dispatch orders on " + cDay )
      ENDIF
   NEXT

   RETURN
