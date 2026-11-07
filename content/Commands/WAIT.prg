/*
 * $DOC$
 * $NAME$
 * WAIT
 *
 * $ONELINER$
 * WAIT* Suspend program processing until a key is pressed
 *
 * $SYNTAX$
 * WAIT [expPrompt] [TO idVar]
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

   LOCAL cOperator := ""

   WAIT "Press a key to start the reconciliation" TO cOperator

   ? "Reconciliation started by:", cOperator

   RETURN
