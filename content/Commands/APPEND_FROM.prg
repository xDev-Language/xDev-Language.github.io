/*
 * $DOC$
 * $NAME$
 * APPEND FROM
 *
 * $ONELINER$
 * APPEND FROM Import records from a database (.dbf) file or ASCII text file
 *
 * $SYNTAX$
 * APPEND FROM xcFile
 *    [FIELDS idField list]
 *    [scope] [WHILE lCondition] [FOR lCondition]
 *    [SDF | DELIMITED [WITH BLANK | xcDelimiter] |
 *    [VIA xcDriver]]
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

   LOCAL cImport := "incoming.dbf"

   FErase( "demo.dbf" )

   DbCreate( "demo.dbf", { { "ID", "N", 4, 0 }, { "NAME", "C", 20, 0 }, { "REGION", "C", 2, 0 }, { "AMOUNT", "N", 9, 2 }, { "PAID", "L", 1, 0 } } )

   USE demo NEW

   APPEND BLANK

   REPLACE ID WITH 1, NAME WITH "Ada", REGION WITH "NW", AMOUNT WITH 125.50, PAID WITH .F.

   APPEND BLANK

   REPLACE ID WITH 2, NAME WITH "Bela", REGION WITH "SE", AMOUNT WITH 80.00, PAID WITH .T.

   APPEND BLANK

   REPLACE ID WITH 3, NAME WITH "Cy", REGION WITH "NW", AMOUNT WITH 210.75, PAID WITH .F.

   FErase( cImport )

   DbCreate( cImport, { { "ID", "N", 4, 0 }, { "NAME", "C", 20, 0 }, { "REGION", "C", 2, 0 }, { "AMOUNT", "N", 9, 2 }, { "PAID", "L", 1, 0 } } )

   USE incoming NEW

   APPEND BLANK

   REPLACE ID WITH 4, NAME WITH "Dara", REGION WITH "NW", AMOUNT WITH 42.00, PAID WITH .F.

   SELECT demo

   APPEND FROM incoming FIELDS ID, NAME, REGION, AMOUNT, PAID FOR REGION == "NW"

   ? "Imported NW orders:", LastRec()

   RETURN
