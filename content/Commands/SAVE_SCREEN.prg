/*
 * $DOC$
 * $NAME$
 * SAVE SCREEN
 *
 * $ONELINER$
 * SAVE SCREEN* Save the current screen to a buffer or variable
 *
 * $SYNTAX$
 * SAVE SCREEN [TO idVar]
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

   LOCAL cScreen := ""

   @ 2, 2 SAY "Order queue - page 1"

   SAVE SCREEN TO cScreen

   CLEAR SCREEN

   @ 2, 2 SAY "Temporary detail panel"

   WAIT "Press a key to restore the queue"

   RESTORE SCREEN FROM cScreen

   RETURN
