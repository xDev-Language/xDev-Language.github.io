/*
 * $DOC$
 * $NAME$
 * Greater than or equal (>=)
 *
 * $ONELINER$
 * Return true when the left operand sorts after or compares equal to the right operand.
 *
 * $SYNTAX$
 * left >= right
 *
 * $DESCRIPTION$
 * Return true when the left operand sorts after or compares equal to the right operand.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nPoints
   LOCAL nLimit := 60

   FOR EACH nPoints IN { 59, 60, 81 }
      IF nPoints >= nLimit
         QOut( nPoints, "Pass" )
      ELSE
         QOut( nPoints, "Retake" )
      ENDIF
   NEXT

   RETURN
