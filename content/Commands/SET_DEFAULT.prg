/*
 * $DOC$
 * $NAME$
 * SET DEFAULT
 *
 * $ONELINER$
 * SET DEFAULT Set the CA-Clipper default drive and directory
 *
 * $SYNTAX$
 * SET DEFAULT TO [xcPathspec]
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

   // Replace data with the writable directory used by your application.
   SET DEFAULT TO "."

   DbCreate( "daily.dbf", { { "RUN_DATE", "D", 8, 0 }, { "ROWS", "N", 6, 0 } } )

   USE daily NEW

   APPEND BLANK

   REPLACE RUN_DATE WITH Date(), ROWS WITH 128

   ? "Created in the selected default directory:", Alias()

   RETURN
