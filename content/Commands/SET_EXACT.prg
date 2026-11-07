/*
 * $DOC$
 * $NAME$
 * SET EXACT
 *
 * $ONELINER$
 * SET EXACT* Toggle exact matches for character strings
 *
 * $SYNTAX$
 * SET EXACT on | OFF | xlToggle
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

   SET EXACT OFF

   ? "Prefix search matches:", "AL" == "ALPHA"

   SET EXACT ON

   ? "Exact comparison matches:", "AL" == "ALPHA"

   RETURN
