/*
 * $DOC$
 * $NAME$
 * SET SCOREBOARD
 *
 * $ONELINER$
 * SET SCOREBOARD Toggle the message display from READ or MEMOEDIT()
 *
 * $SYNTAX$
 * SET SCOREBOARD ON | off | xlToggle
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

   SET SCOREBOARD OFF

   @ 2, 5 SAY "Import running; status line hidden."

   ? "Validated rows:", 128

   SET SCOREBOARD ON

   WAIT "Import complete; press a key to return"

   RETURN
