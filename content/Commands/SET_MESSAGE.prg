/*
 * $DOC$
 * $NAME$
 * SET MESSAGE
 *
 * $ONELINER$
 * SET MESSAGE Set the @...PROMPT message line row
 *
 * $SYNTAX$
 * SET MESSAGE TO [nRow [CENTER | CENTRE]]
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

   LOCAL nChoice := 0

   SET MESSAGE TO 22 CENTER

   @ 5, 8 PROMPT "Approve batch" MESSAGE "All rows passed validation"

   @ 6, 8 PROMPT "Reject batch" MESSAGE "Return the file to the sender"

   MENU TO nChoice

   SET MESSAGE TO

   ? "Selected workflow:", nChoice

   RETURN
