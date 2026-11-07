/*
 * $DOC$
 * $NAME$
 * SET DEVICE
 *
 * $ONELINER$
 * SET DEVICE Direct @...SAYs to the screen or printer
 *
 * $SYNTAX$
 * SET DEVICE TO SCREEN | printer
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

   SET DEVICE TO SCREEN

   @ 2, 5 SAY "Preview the dispatch note"

   SET DEVICE TO PRINTER

   @ 1, 1 SAY "Dispatch note: order 1042"

   @ 2, 1 SAY "Carrier: North route"

   SET DEVICE TO SCREEN

   ? "Dispatch note sent to the configured printer."

   RETURN
