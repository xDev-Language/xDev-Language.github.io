/*
 * $DOC$
 * $NAME$
 * Assignment (:=)
 *
 * $ONELINER$
 * Store the value in a writable target.
 *
 * $SYNTAX$
 * target := value
 *
 * $DESCRIPTION$
 * Store the value in a writable target. The assignment expression yields the assigned value. Chained assignments associate from right to left. = is always a comparison.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nOpening
   LOCAL nBalance
   LOCAL nReceipt := 12

   nBalance := nOpening := 50
   nBalance := nBalance + nReceipt
   QOut( "Opening", nOpening, "closing", nBalance )
   QOut( "Movement", nBalance - nOpening )

   RETURN
