/*
 * $DOC$
 * $NAME$
 * DbClearIndex()
 *
 * $ONELINER$
 * Close all indexes of the current work area
 *
 * $SYNTAX$
 * DbClearIndex() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbClearIndex() removes all open orders from the current work area's order
 * list and closes their index files.
 *
 * $NOTES$
 * It does not delete the index files from disk.
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
 * DbSetIndex(), DbReIndex(), DbCloseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()


   DbUseArea( .T., , "people.dbf", "People" )
   DbCreateIndex( "clear_index.ntx", "NAME", {|| FIELD->NAME } )
   QOut( "Before clear: " + IIF( Empty( OrdName( 1 ) ), "NONE", OrdName( 1 ) ) )
   DbClearIndex()
   QOut( "After clear: " + IIF( Empty( OrdName( 1 ) ), "NONE", OrdName( 1 ) ) )
   DbCloseArea()
   FErase( "clear_index.ntx" )


   RETURN
