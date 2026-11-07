/*
 * $DOC$
 * $NAME$
 * ZAP
 *
 * $ONELINER$
 * ZAP Remove all records from the current database file
 *
 * $SYNTAX$
 * ZAP
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

   FErase( "demo.dbf" )

   DbCreate( "demo.dbf", { { "ID", "N", 4, 0 }, { "NAME", "C", 20, 0 }, { "REGION", "C", 2, 0 }, { "AMOUNT", "N", 9, 2 }, { "PAID", "L", 1, 0 } } )

   USE demo NEW

   APPEND BLANK

   REPLACE ID WITH 1, NAME WITH "Ada", REGION WITH "NW", AMOUNT WITH 125.50, PAID WITH .F.

   APPEND BLANK

   REPLACE ID WITH 2, NAME WITH "Bela", REGION WITH "SE", AMOUNT WITH 80.00, PAID WITH .T.

   APPEND BLANK

   REPLACE ID WITH 3, NAME WITH "Cy", REGION WITH "NW", AMOUNT WITH 210.75, PAID WITH .F.

   ? "Records before reset:", LastRec()

   ZAP

   ? "Records after reset:", LastRec()

   RETURN
