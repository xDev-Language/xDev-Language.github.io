/*
 * $DOC$
 * $NAME$
 * DbClearFilter()
 *
 * $ONELINER$
 * Clear the filter of the current work area
 *
 * $SYNTAX$
 * DbClearFilter() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbClearFilter() removes the filter expression from the current work area.
 * Subsequent navigation can see every record that is not excluded by other
 * work-area rules.
 *
 * $NOTES$
 * The function does not move the record pointer.
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
 * DbSetFilter(), DbClearIndex(), DbGoTop()
 *
 * $DOCEND$
 */

PROCEDURE Main()


   DbCreate( "filter_demo.dbf", { { "AGE", "N", 3, 0 } } )
   DbUseArea( .T., , "filter_demo.dbf", "People" )
   DbSetFilter( {|| FIELD->AGE >= 18 }, "AGE >= 18" )
   QOut( "Before clear: " + DbFilter() )
   DbClearFilter()
   QOut( "After clear: " + IIF( Empty( DbFilter() ), "EMPTY", DbFilter() ) )
   DbCloseArea()
   FErase( "filter_demo.dbf" )


   RETURN
