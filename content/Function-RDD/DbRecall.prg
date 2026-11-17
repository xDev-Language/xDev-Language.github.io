/*
 * $DOC$
 * $NAME$
 * DbRecall()
 *
 * $ONELINER$
 * Reinstate a record marked for deletion
 *
 * $SYNTAX$
 * DbRecall() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbRecall() clears the deletion mark on the current record in the current
 * work area. It can restore a record until DbPack() removes it physically.
 *
 * $NOTES$
 * The current work area must be writable.
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
 * DbDelete(), DbPack(), Deleted()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbRecall()
   QOut( "Deleted after recall: " + IIF( Deleted(), "YES", "NO" ) )
   DbCloseArea()

   RETURN
