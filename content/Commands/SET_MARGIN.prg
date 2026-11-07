/*
 * $DOC$
 * $NAME$
 * SET MARGIN
 *
 * $ONELINER$
 * SET MARGIN Set the page offset for all printed output
 *
 * $SYNTAX$
 * SET MARGIN TO [nPageOffset]
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

   SET PRINTER TO "dispatch.txt"

   SET MARGIN TO 5

   SET PRINTER ON

   ? "Dispatch manifest"

   ? "Order 1042     North route"

   SET PRINTER OFF

   SET PRINTER TO

   RETURN
