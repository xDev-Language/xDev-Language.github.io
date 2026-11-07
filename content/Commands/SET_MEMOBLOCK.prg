/*
 * $DOC$
 * $NAME$
 * SET MEMOBLOCK
 *
 * $ONELINER$
 * SET MEMOBLOCK Change the block size for memo files
 *
 * $SYNTAX$
 * SET MEMOBLOCK TO nSize
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

   SET MEMOBLOCK TO 64

   DbCreate( "notes.dbf", { { "ORDER_ID", "N", 5, 0 }, { "DETAILS", "M", 10, 0 } } )

   USE notes NEW

   APPEND BLANK

   REPLACE ORDER_ID WITH 1042, DETAILS WITH "Customer requested a morning delivery window."

   ? "Stored memo:", MEMOREAD( "notes.dbt" )

   RETURN
