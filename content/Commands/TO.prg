/*
 * $DOC$
 * $NAME$
 * TO
 *
 * $ONELINER$
 * @...TO Draw a single- or double-line box
 *
 * $SYNTAX$
 * @ nTop, nLeft
 *    TO nBottom, nRight [DOUBLE] [COLOR cColorString]
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

   @ 2, 2 TO 12, 72 DOUBLE

   @ 4, 5 SAY "Daily reconciliation"

   @ 6, 5 SAY "Imported: 128 records"

   @ 7, 5 SAY "Rejected:   2 records"

   @ 9, 5 SAY "Press Esc to close this panel"

   RETURN
