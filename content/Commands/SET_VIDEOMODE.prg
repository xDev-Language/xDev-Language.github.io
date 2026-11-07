/*
 * $DOC$
 * $NAME$
 * SET VIDEOMODE
 *
 * $ONELINER$
 * SET VIDEOMODE Change the current video mode of the current application
 *
 * $SYNTAX$
 * SET VIDEOMODE TO nVideoMode
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

   // Mode 3 is the standard 80-column text mode on DOS-compatible drivers.
   SET VIDEOMODE TO 3

   CLEAR SCREEN

   @ 0, 0 SAY "Order terminal - 80 column layout"

   @ 2, 0 SAY "Press a key to continue"

   WAIT

   RETURN
