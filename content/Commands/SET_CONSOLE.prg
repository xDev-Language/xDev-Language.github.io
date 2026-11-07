/*
 * $DOC$
 * $NAME$
 * SET CONSOLE
 *
 * $ONELINER$
 * SET CONSOLE Toggle console display to the screen
 *
 * $SYNTAX$
 * SET CONSOLE ON | off | xlToggle
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

   SET CONSOLE OFF

   ? "This status line is suppressed."

   SET CONSOLE ON

   ? "Console restored for the operator."

   RETURN
