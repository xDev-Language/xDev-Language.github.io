/*
 * $DOC$
 * $NAME$
 * SET EVENTMASK
 *
 * $ONELINER$
 * SET EVENTMASK Specify events to be returned by the INKEY() function
 *
 * $SYNTAX$
 * SET EVENTMASK TO nEventMask
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

   SET EVENTMASK TO 0

   ? "Only ordinary keyboard input is requested."

   WAIT "Press a key to continue"

   SET EVENTMASK TO 65535

   RETURN
