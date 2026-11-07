/*
 * $DOC$
 * $NAME$
 * SET DATE
 *
 * $ONELINER$
 * SET DATE Set the date format for input and display
 *
 * $SYNTAX$
 * SET DATE FORMAT [TO] cDateFormat
 * SET DATE [TO] AMERICAN | ansi | British | French
 *    | German | Italian | Japan | USA
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

   SET DATE TO BRITISH

   SET CENTURY ON

   ? "Regional format:", DToC( Date() )

   SET DATE FORMAT TO "YYYY-MM-DD"

   ? "ISO format:", DToC( Date() )

   RETURN
