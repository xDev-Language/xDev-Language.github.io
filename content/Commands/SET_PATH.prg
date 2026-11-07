/*
 * $DOC$
 * $NAME$
 * SET PATH
 *
 * $ONELINER$
 * SET PATH Specify the CA-Clipper search path for opening files
 *
 * $SYNTAX$
 * SET PATH TO [xcPathspec list]
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

   // Ensure both folders exist before running this example.
   SET PATH TO "data", "archive"

   USE demo NEW

   ? "Opened demo.dbf from the configured search path:", Alias()

   CLOSE demo

   SET PATH TO

   RETURN
