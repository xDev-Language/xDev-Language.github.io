/*
 * $DOC$
 * $NAME$
 * Less than or equal (<=)
 *
 * $ONELINER$
 * Return true when the left operand sorts before or compares equal to the right operand.
 *
 * $SYNTAX$
 * left <= right
 *
 * $DESCRIPTION$
 * Return true when the left operand sorts before or compares equal to the right operand.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nWeight
   LOCAL nLimit := 20

   FOR EACH nWeight IN { 18, 20, 21 }
      IF nWeight <= nLimit
         QOut( nWeight, "Standard parcel" )
      ELSE
         QOut( nWeight, "Oversize parcel" )
      ENDIF
   NEXT

   RETURN
