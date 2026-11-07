/*
 * $DOC$
 * $NAME$
 * SET CURSOR
 *
 * $ONELINER$
 * SET CURSOR Toggle the screen cursor on or off
 *
 * $SYNTAX$
 * SET CURSOR ON | off | xlToggle
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

   SET CURSOR OFF

   @ 4, 5 SAY "Loading validated orders..."

   Inkey( 1 )

   SET CURSOR ON

   @ 6, 5 SAY "Ready for input."

   RETURN
