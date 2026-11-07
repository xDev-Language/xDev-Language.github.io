/*
 * $DOC$
 * $NAME$
 * QUIT
 *
 * $ONELINER$
 * QUIT Terminate program processing
 *
 * $SYNTAX$
 * QUIT | CANCEL*
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

   ? "The batch has finished successfully."

   QUIT

   ? "This statement is not executed."

   RETURN
