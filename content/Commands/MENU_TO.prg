/*
 * $DOC$
 * $NAME$
 * MENU TO
 *
 * $ONELINER$
 * MENU TO Execute a lightbar menu for defined PROMPTs
 *
 * $SYNTAX$
 * MENU TO idVar
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

   @ 4, 8 PROMPT "Open order queue" MESSAGE "Review orders waiting for action"

   @ 5, 8 PROMPT "Export daily report" MESSAGE "Create a portable report file"

   @ 6, 8 PROMPT "Exit" MESSAGE "Close the application"

   MENU TO nChoice

   DO CASE
   CASE nChoice == 1
      ? "Open the order queue"
   CASE nChoice == 2
      ? "Export the daily report"
   OTHERWISE
      ? "No action selected"

   ENDCASE

   RETURN
