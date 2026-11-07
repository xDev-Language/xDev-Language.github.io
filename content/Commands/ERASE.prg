/*
 * $DOC$
 * $NAME$
 * ERASE
 *
 * $ONELINER$
 * ERASE Remove a file from disk
 *
 * $SYNTAX$
 * ERASE | DELETE FILE xcFile
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

   MemoWrit( "temporary.txt", "This file can be regenerated." )

   ERASE "temporary.txt"

   ? "Temporary file removed:", ! File( "temporary.txt" )

   RETURN
