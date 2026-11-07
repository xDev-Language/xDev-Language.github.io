/*
 * $DOC$
 * $NAME$
 * TYPE
 *
 * $ONELINER$
 * TYPE Display the contents of a text file
 *
 * $SYNTAX$
 * TYPE xcFile [TO PRINTER] [TO FILE xcOutFile]
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

   MemoWrit( "handoff.txt", "Shift handoff: 3 orders require approval." + Chr( 13 ) + Chr( 10 ) )

   TYPE "handoff.txt"

   TYPE "handoff.txt" TO FILE "handoff-copy.txt"

   RETURN
