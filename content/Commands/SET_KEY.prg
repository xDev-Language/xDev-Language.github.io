/*
 * $DOC$
 * $NAME$
 * SET KEY
 *
 * $ONELINER$
 * SET KEY Assign a procedure invocation to a key
 *
 * $SYNTAX$
 * SET KEY nInkeyCode TO [idProcedure]
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

   SET KEY 28 TO ShowHelp

   WAIT "Press F1 for the import checklist"

   SET KEY 28 TO

   RETURN


PROCEDURE ShowHelp

   ? "Check the file date, header row, and duplicate order IDs."

   RETURN
