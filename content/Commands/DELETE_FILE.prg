/*
 * $DOC$
 * $NAME$
 * DELETE FILE
 *
 * $ONELINER$
 * DELETE FILE Remove a file from disk
 *
 * $SYNTAX$
 * DELETE FILE | ERASE xcFile
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

   MemoWrit( "stale-import.txt", "obsolete import" )

   DELETE FILE "stale-import.txt"

   ? "Import file removed:", ! File( "stale-import.txt" )

   RETURN
