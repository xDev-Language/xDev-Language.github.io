/*
 * $DOC$
 * $NAME$
 * DbEval()
 *
 * $ONELINER$
 * Evaluate a block for records in a scope
 *
 * $SYNTAX$
 * DbEval( bBlock, [bForCondition], [bWhileCondition], [nNextRecords], [nRecord], [lRest] ) --> NIL
 *
 * $ARGUMENTS$
 * `bBlock` Block evaluated for each selected record. Remaining arguments define the scope.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbEval() walks records in the current work area and evaluates bBlock for
 * each record accepted by the FOR, WHILE and range arguments.
 *
 * $NOTES$
 * The record pointer is restored after evaluation.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions RDD
 *
 * $HEADER$
 *
 * $SEEALSO$
 * DbCount(), DbLocate(), DbSum()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "eval_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "eval_demo.dbf", "People" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbAppend()
   FieldPut( 1, "Jan" )
   DbCommit()
   QOut( "Names:" )
   DbEval( {|| QOut( FIELD->NAME ) } )
   DbCloseArea()
   FErase( "eval_demo.dbf" )


   RETURN
