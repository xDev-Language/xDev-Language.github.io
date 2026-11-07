/*
 * $DOC$
 * $NAME$
 * SET PRINTER
 *
 * $ONELINER$
 * SET PRINTER Toggle echo of output to printer or set the print destination
 *
 * $SYNTAX$
 * SET PRINTER on | OFF | xlToggle
 * SET PRINTER TO [xcDevice | xcFile [ADDITIVE]]
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

   SET PRINTER TO "reconciliation.txt"

   SET PRINTER ON

   ? "Reconciliation run:", DToC( Date() ), Time()

   ? "Orders examined:", 128

   SET PRINTER OFF

   SET PRINTER TO

   TYPE "reconciliation.txt"

   RETURN
