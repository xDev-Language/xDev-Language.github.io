/*
 * $DOC$
 * $NAME$
 * DbDelete()
 *
 * $ONELINER$
 * Mark the current record for deletion
 *
 * $SYNTAX$
 * DbDelete() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbDelete() marks the current record in the current work area as deleted.
 * The record remains in the file until it is physically removed by DbPack().
 *
 * $NOTES$
 * The deleted flag can be inspected with Deleted(). Use DbRecall() to clear it.
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
 * DbRecall(), DbPack(), Deleted()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "delete_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "delete_demo.dbf", "People" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbCommit()
   DbGoTop()
   DbDelete()
   QOut( "Deleted: " + IIF( Deleted(), "YES", "NO" ) )
   DbRecall()
   QOut( "After recall: " + IIF( Deleted(), "YES", "NO" ) )
   DbCloseArea()
   FErase( "delete_demo.dbf" )


   RETURN
