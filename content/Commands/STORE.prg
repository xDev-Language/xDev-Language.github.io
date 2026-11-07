/*
 * $DOC$
 * $NAME$
 * STORE
 *
 * $ONELINER$
 * STORE* Assign a value to one or more variables
 *
 * $SYNTAX$
 * STORE exp TO idVar list
 * idVar = exp
 * idVar := [ idVar2 := ...] exp
 *
 * $ARGUMENTS$
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Commands
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

#include "std.ch"

PROCEDURE Main()

   LOCAL nSubtotal := 0, nTax := 0, nTotal := 0

   STORE 249.95 TO nSubtotal

   STORE nSubtotal * 0.08 TO nTax

   nTotal := nSubtotal + nTax

   ? "Subtotal:", nSubtotal, "Tax:", nTax, "Total:", nTotal

   RETURN
