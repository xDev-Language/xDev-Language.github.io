/*
 * $DOC$
 * $NAME$
 * DbCount()
 *
 * $ONELINER$
 * Count records selected by a scope
 *
 * $SYNTAX$
 * DbCount( [bFor], [bWhile], [nNext], [nRecord], [lRest] ) --> nCount
 *
 * $ARGUMENTS$
 * `bFor`, `bWhile`, `nNext`, `nRecord`, `lRest` Optional record-scope controls.
 *
 * $RETURNS$
 * The number of records selected by the scope.
 *
 * $DESCRIPTION$
 * DbCount() counts records in the current work area. A FOR or WHILE block and
 * the numeric scope arguments restrict which records are counted.
 *
 * $NOTES$
 * The record pointer is restored after the operation.
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
 * DbAverage(), DbSum(), RecCount()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "count_demo.dbf", { { "AGE", "N", 3, 0 } } )
   DbUseArea( .T., , "count_demo.dbf", "People" )
   DbAppend()
   FieldPut( 1, 20 )
   DbAppend()
   FieldPut( 1, 15 )
   DbCommit()
   QOut( "Adults: " + LTrim( Str( DbCount( {|| FIELD->AGE >= 18 } ) ) ) )
   DbCloseArea()
   FErase( "count_demo.dbf" )

RETURN
