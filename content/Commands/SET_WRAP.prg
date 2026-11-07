/*
 * $DOC$
 * $NAME$
 * SET WRAP
 *
 * $ONELINER$
 * SET WRAP* Toggle wrapping of the highlight in menus
 *
 * $SYNTAX$
 * SET WRAP on | OFF | xlToggle
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

   LOCAL nChoice := 1

   SET WRAP ON

   @ 5, 8 PROMPT "First queue"

   @ 6, 8 PROMPT "Second queue"

   @ 7, 8 PROMPT "Exit"

   MENU TO nChoice

   SET WRAP OFF

   ? "Selected menu item:", nChoice

   RETURN
