/*
 * $DOC$
 * $NAME$
 * RESTORE SCREEN
 *
 * $ONELINER$
 * RESTORE SCREEN* Display a saved screen
 *
 * $SYNTAX$
 * RESTORE SCREEN [FROM cScreen]
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

   LOCAL cBefore := ""

   @ 2, 2 SAY "Order review screen"

   SAVE SCREEN TO cBefore

   CLEAR SCREEN

   @ 2, 2 SAY "Temporary detail panel"

   WAIT "Press a key to return"

   RESTORE SCREEN FROM cBefore

   RETURN
