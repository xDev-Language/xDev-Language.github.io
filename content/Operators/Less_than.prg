/*
 * $DOC$
 * $NAME$
 * Less than (<)
 *
 * $ONELINER$
 * Return true when the left operand sorts before the right operand.
 *
 * $SYNTAX$
 * left < right
 *
 * $DESCRIPTION$
 * Return true when the left operand sorts before the right operand.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nStock
   LOCAL nLimit := 5

   FOR EACH nStock IN { 0, 4, 5, 8 }
      IF nStock < nLimit
         QOut( nStock, "Reorder" )
      ELSE
         QOut( nStock, "Stock sufficient" )
      ENDIF
   NEXT

   RETURN
