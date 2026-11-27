/*
 * $DOC$
 * $NAME$
 * DbAverage()
 *
 * $ONELINER$
 * Calculate the average of an expression over selected records
 *
 * $SYNTAX$
 * DbAverage( bExpression, [bFor], [bWhile], [nNext], [nRecord], [lRest] ) --> nAverage
 *
 * $ARGUMENTS$
 * `bExpression` Block evaluated for each selected record.
 * `bFor`, `bWhile`, `nNext`, `nRecord`, `lRest` Optional record-scope controls.
 *
 * $RETURNS$
 * The arithmetic average of the expression values.
 *
 * $DESCRIPTION$
 * DbAverage() evaluates bExpression in the current work area and returns the
 * average over records selected by the scope arguments. The record pointer is
 * restored after the operation.
 *
 * $NOTES$
 * The expression should return numeric values. An empty scope returns zero.
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
 * DbCount(), DbSum(), DbTotal()
 *
 * $DOCEND$
 */

PROCEDURE Main()


   DbCreate( "average_demo.dbf", { { "AMOUNT", "N", 10, 2 } } )
   DbUseArea( .T., , "average_demo.dbf", "Sales" )
   DbAppend()
   FieldPut( 1, 10 )
   DbAppend()
   FieldPut( 1, 20 )
   DbCommit()
   QOut( "Average: " + LTrim( Str( DbAverage( {|| FIELD->AMOUNT } ) ) ) )
   DbCloseArea()
   FErase( "average_demo.dbf" )

   
   RETURN
