/*
 * $DOC$
 * $NAME$
 * EJECT
 *
 * $ONELINER$
 * EJECT Advance the printhead to top of form
 *
 * $SYNTAX$
 * EJECT
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

   SET PRINTER TO "daily.txt"

   SET PRINTER ON

   ? "Daily warehouse pick list"

   ? "SKU       DESCRIPTION          QTY"

   ? "A-100     Packing tape           8"

   EJECT

   ? "Exceptions"

   ? "None"

   SET PRINTER OFF

   SET PRINTER TO

   RETURN
