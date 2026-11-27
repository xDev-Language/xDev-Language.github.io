/*
 * $DOC$
 * $NAME$
 * Logical and (.AND.)
 *
 * $ONELINER$
 * Return true when both logical operands are true.
 *
 * $SYNTAX$
 * left .AND. right
 *
 * $DESCRIPTION$
 * Return true when both logical operands are true. A false left operand skips evaluation of the right operand.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aBins := { "Parts", "Returns" }
   LOCAL nBin

   FOR EACH nBin IN { 0, 1, 2, 3 }
      IF nBin >= 1 .AND. nBin <= Len( aBins ) .AND. aBins[ nBin ] == "Returns"
         QOut( "Send to inspection", nBin )
      ENDIF
   NEXT

   RETURN
