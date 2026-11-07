/*
 * $DOC$
 * $NAME$
 * CANCEL
 *
 * $ONELINER$
 * CANCEL* Terminate program processing
 *
 * $SYNTAX$
 * CANCEL* | QUIT
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

   ? "This demonstration stops here without running later statements."

   CANCEL

   ? "This line is intentionally unreachable."

   RETURN
