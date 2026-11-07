/*
 * $DOC$
 * $NAME$
 * SET EPOCH
 *
 * $ONELINER$
 * SET EPOCH Control the interpretation of dates with no century digits
 *
 * $SYNTAX$
 * SET EPOCH TO nYear
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

   SET DATE TO ANSI

   SET EPOCH TO 1950

   ? "Interpret two-digit years using the 1950 window:", CToD( "01/01/49" )

   SET EPOCH TO 2020

   ? "A later application window:", CToD( "01/01/49" )

   RETURN
