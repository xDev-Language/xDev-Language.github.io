/*
 * $DOC$
 * $NAME$
 * SET INTENSITY
 *
 * $ONELINER$
 * SET INTENSITY Toggle enhanced display of GETs and PROMPTs
 *
 * $SYNTAX$
 * SET INTENSITY ON | off | xlToggle
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

   SET INTENSITY ON

   @ 3, 5 SAY "Selected order" COLOR "W+/B"

   @ 4, 5 SAY "Unselected order" COLOR "N/W"

   SET INTENSITY OFF

   RETURN
