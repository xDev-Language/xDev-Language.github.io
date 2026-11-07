/*
 * $DOC$
 * $NAME$
 * SET CENTURY
 *
 * $ONELINER$
 * SET CENTURY Modify the date format to include or omit century digits
 *
 * $SYNTAX$
 * SET CENTURY on | OFF | xlToggle
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

   ? "Full audit date:", DToC( Date() )

   SET CENTURY OFF

   RETURN
