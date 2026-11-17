/*
 * $DOC$
 * $NAME$
 * DbSetFilter()
 *
 * $ONELINER$
 * Set a filter condition
 *
 * $SYNTAX$
 * DbSetFilter( bCondition, [cCondition] ) --> NIL
 *
 * $ARGUMENTS$
 * `bCondition` Filter block. `cCondition` Optional textual expression.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbSetFilter() restricts navigation in the current work area to records for
 * which bCondition returns true.
 *
 * $NOTES$
 * Use DbClearFilter() to remove the filter. The filter does not delete records.
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
 * DbClearFilter(), DbFilter(), DbGoTop()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbSetFilter( {|| FIELD->AGE >= 18 }, "AGE >= 18" )
   QOut( "Filter: " + DbFilter() )
   DbCloseArea()

RETURN
