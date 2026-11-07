/*
 * $DOC$
 * $NAME$
 * DIR
 *
 * $ONELINER$
 * DIR* Display a listing of files from a specified path
 *
 * $SYNTAX$
 * DIR [xcFileSpec]
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

   DIR "*.dbf"

   ? "Review the listed data files before starting the import."

   RETURN
