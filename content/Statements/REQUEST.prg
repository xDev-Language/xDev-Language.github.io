/*
 * $DOC$
 * $NAME$
 * REQUEST
 *
 * $ONELINER$
 * Require symbols when linking a program
 *
 * $SYNTAX$
 * REQUEST idSymbol [, idSymbol2 ...]
 *
 * $ARGUMENTS$
 * Each name identifies a symbol the linker must resolve.
 *
 * $DESCRIPTION$
 * REQUEST pulls in a module from a static library when the symbol would
 * otherwise be unreferenced. Use an ANNOUNCE name or an exported routine
 * name. Write REQUEST at module level or before executable statements
 * in a routine.
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ANNOUNCE, INIT PROCEDURE, EXIT PROCEDURE
 *
 * $DOCEND$
 */

// Link with the library containing ANNOUNCE.prg. The only reference to
// its audit hooks is the module name requested here.
REQUEST InvoiceAudit

PROCEDURE Main()

   LOCAL aAmounts := { 2400, -500, 1200 }
   LOCAL nAmount
   LOCAL nBalance := 0

   FOR EACH nAmount IN aAmounts
      nBalance += nAmount
      QOut( "Posted cents", nAmount, "balance", nBalance )
   NEXT

   RETURN
