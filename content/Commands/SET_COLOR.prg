/*
 * $DOC$
 * $NAME$
 * SET COLOR
 *
 * $ONELINER$
 * SET COLOR* Define screen colors
 *
 * $SYNTAX$
 * SET COLOR | COLOUR TO [[standard]
 *    [,enhanced] [,border] [,background]
 *    [,unselected]] | (cColorString)
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

   SET COLOR TO "W+/B", "GR+/B", "N/B", "W/B", "N/W"

   @ 2, 5 SAY "Order review" COLOR "W+/B"

   @ 4, 5 SAY "Approved" COLOR "GR+/B"

   RETURN
