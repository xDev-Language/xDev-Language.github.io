/* $DOC$
 * $NAME$
 * OrdListClear()
 * $ONELINER$
 * Clear the current order list
 * $SYNTAX$
 * OrdListClear() --> NIL
 * $ARGUMENTS$
 * None.
 * $RETURNS$
 * NIL.
 * $DESCRIPTION$
 * Closes all indexes in the current order list.
 * $NOTES$
 * Index files are not deleted.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$
 * Functions RDD
 * $HEADER$
 * $SEEALSO$
 * OrdListAdd(), DbClearIndex(), OrdListRebuild()
 * $DOCEND$
 * */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   OrdListClear()
   QOut( "Order list cleared" )
   DbCloseArea()

RETURN
