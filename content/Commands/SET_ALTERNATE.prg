/*
 * $DOC$
 * $NAME$
 * SET ALTERNATE
 *
 * $ONELINER$
 * SET ALTERNATE Echo console output to a text file
 *
 * $SYNTAX$
 * SET ALTERNATE TO [xcFile [ADDITIVE]]
 * SET ALTERNATE on | OFF | xlToggle
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

   SET ALTERNATE TO "audit.txt"

   SET ALTERNATE ON

   ? "Import started:", DToC( Date() ), Time()

   ? "Rows accepted:", 128

   SET ALTERNATE OFF

   CLOSE ALTERNATE

   TYPE "audit.txt"

   RETURN
