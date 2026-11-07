/*
 * $DOC$
 * $NAME$
 * COPY FILE
 *
 * $ONELINER$
 * COPY FILE Copy a file to a new file or to a device
 *
 * $SYNTAX$
 * COPY FILE xcSourceFile TO xcTargetFile|xcDevice
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

   MemoWrit( "draft.txt", "Customer 1042: address verified" + Chr( 13 ) + Chr( 10 ) )

   COPY FILE "draft.txt" TO "archive.txt"

   ? "Archived bytes:", FSize( "archive.txt" )

   RETURN
