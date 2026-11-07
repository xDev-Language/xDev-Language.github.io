/*
 * $DOC$
 * $NAME$
 * SET FUNCTION
 *
 * $ONELINER$
 * SET FUNCTION Assign a character string to a function key
 *
 * $SYNTAX$
 * SET FUNCTION nFunctionKey TO cString
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

   SET FUNCTION 1 TO "Help: F1"

   SET KEY 28 TO ShowHelp

   WAIT "Press F1 to see field guidance"

   SET KEY 28 TO

   RETURN


PROCEDURE ShowHelp

   ? "Enter the customer number from the signed order."

   RETURN
