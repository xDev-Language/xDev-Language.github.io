/*
 * $DOC$
 * $NAME$
 * SET FIXED
 *
 * $ONELINER$
 * SET FIXED Toggle fixing of the number of decimal digits displayed
 *
 * $SYNTAX$
 * SET FIXED on | OFF | xlToggle
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

   SET DECIMALS TO 3

   SET FIXED ON

   ? "Fixed precision:", 12.5

   SET FIXED OFF

   ? "Natural precision:", 12.5

   RETURN
