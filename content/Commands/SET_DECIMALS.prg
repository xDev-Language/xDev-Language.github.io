/*
 * $DOC$
 * $NAME$
 * SET DECIMALS
 *
 * $ONELINER$
 * SET DECIMALS Set the number of decimal places to be displayed
 *
 * $SYNTAX$
 * SET DECIMALS TO [nDecimals]
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

   SET DECIMALS TO 4

   ? "Unit price:", 19.9957

   SET DECIMALS TO 2

   ? "Invoice total:", 19.9957

   RETURN
