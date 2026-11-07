/*
 * $DOC$
 * $NAME$
 * RENAME
 *
 * $ONELINER$
 * RENAME Change the name of a file
 *
 * $SYNTAX$
 * RENAME xcOldFile TO xcNewFile
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

   MemoWrit( "batch.tmp", "Validated import" )

   RENAME "batch.tmp" TO "batch.ready"

   ? "Ready for processing:", File( "batch.ready" )

   RETURN
