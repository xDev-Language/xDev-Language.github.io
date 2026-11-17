/*
 * $DOC$
 * $NAME$
 * DbClearRelation()
 *
 * $ONELINER$
 * Clear all relations from the current work area
 *
 * $SYNTAX$
 * DbClearRelation() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbClearRelation() removes every active relation whose child is the current
 * work area. Related child areas are no longer repositioned by the parent.
 *
 * $NOTES$
 * The function does not close either work area.
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
 * DbSetRelation(), DbCloseAll()
 *
 * $DOCEND$
 */

PROCEDURE Main()


   DbUseArea( .T., , "people.dbf", "People" )
   DbUseArea( .T., , "orders.dbf", "Orders" )
   DbSelectArea( "People" )
   DbSetRelation( "Orders", {|| FIELD->ID }, "ID" )
   QOut( "Before clear: " + IIF( Empty( DbRelation( 1 ) ), "NONE", "SET" ) )
   DbClearRelation()
   QOut( "After clear: " + IIF( Empty( DbRelation( 1 ) ), "NONE", "SET" ) )
   DbCloseAll()

   
   RETURN
