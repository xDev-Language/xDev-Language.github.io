/*
 * $DOC$
 * $NAME$
 * CLEAR SCREEN
 *
 * $ONELINER$
 * CLEAR SCREEN Clear the screen and return the cursor home
 *
 * $SYNTAX$
 * CLEAR [SCREEN] | CLS
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

   ? "Temporary status: import complete"

   Inkey( 1 )

   CLEAR SCREEN

   @ 0, 0 SAY "Monthly reconciliation"

   RETURN
