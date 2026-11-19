/*
 * $DOC$
 * $NAME$
 * INIT PROCEDURE
 *
 * $ONELINER$
 * Declare a procedure that runs before Main
 *
 * $SYNTAX$
 * INIT PROCEDURE idProcedure()
 *    statements...
 *    [RETURN]
 *
 * $ARGUMENTS$
 * idProcedure names the startup routine.
 *
 * $DESCRIPTION$
 * Declare INIT PROCEDURE at module level. The runtime invokes the procedure
 * before Main. Use it to initialize state needed by the program.
 * INIT procedures are called by the runtime.
 * A module in a static library can expose an ANNOUNCE name for REQUEST to
 * pull the module and its startup procedure into the program.
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
 * ANNOUNCE, REQUEST, PROCEDURE, EXIT PROCEDURE
 *
 * $DOCEND$
 */

STATIC s_hMinimum

INIT PROCEDURE LoadMinimums()

   LOCAL aRow

   s_hMinimum := { => }
   FOR EACH aRow IN { { "A17", 12 }, { "B24", 7 } }
      s_hMinimum[ aRow[ 1 ] ] := aRow[ 2 ]
   NEXT

   RETURN

PROCEDURE Main()

   LOCAL cCode

   FOR EACH cCode IN { "A17", "B24" }
      QOut( cCode, "reorder below", s_hMinimum[ cCode ] )
   NEXT

   RETURN
