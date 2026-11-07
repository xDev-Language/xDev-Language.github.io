/*
 * $DOC$
 * $NAME$
 * SET BELL
 *
 * $ONELINER$
 * SET BELL Toggle sounding of the bell during full-screen operations
 *
 * $SYNTAX$
 * SET BELL on | OFF | xlToggle
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

   SET BELL ON

   ? Chr( 7 ), "Validation failed; correct the highlighted row."

   SET BELL OFF

   RETURN
