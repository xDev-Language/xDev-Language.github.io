/*
 * $DOC$
 * $NAME$
 * PROCEDURE
 *
 * $ONELINER$
 * Declare a routine that returns NIL
 *
 * $SYNTAX$
 * [STATIC] PROCEDURE idProcedure( [idParam [AS type] [, ...]] )
 *    statements...
 *    [RETURN]
 *
 * $ARGUMENTS$
 * Parameters without AS have type ANY. STATIC limits visibility to the
 * current source file.
 *
 * $DESCRIPTION$
 * Declare a procedure at module level. Call it by name with parentheses or
 * with DO. Use a bare RETURN to leave early. Main is the program entry
 * point and must be visible outside its source file.
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
 * FUNCTION, RETURN, DO, INIT PROCEDURE, EXIT PROCEDURE
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aOrders := { { "R17", 4 }, { "R18", 0 }, { "R19", 8 } }
   LOCAL aOrder

   FOR EACH aOrder IN aOrders
      PrintPickSlip( aOrder[ 1 ], aOrder[ 2 ] )
   NEXT

   RETURN

STATIC PROCEDURE PrintPickSlip( cOrder, nUnits )

   IF nUnits <= 0
      QOut( cOrder, "hold for quantity check" )
      RETURN
   ENDIF
   QOut( "Pick slip", cOrder )
   QOut( "Full trays", Int( nUnits / 6 ), "loose pieces", nUnits % 6 )

   RETURN
