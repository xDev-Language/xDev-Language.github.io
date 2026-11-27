/*
 * $DOC$
 * $NAME$
 * Deleted()
 *
 * $ONELINER$
 * Test the deletion mark of the current record
 *
 * $SYNTAX$
 * Deleted() --> lDeleted
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * `.T.` when the current record is marked for deletion; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * Deleted() reports the deletion flag of the current record without changing it.
 *
 * $NOTES$
 * The flag remains until DbRecall() or DbPack() changes the record.
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
 * DbDelete(), DbRecall(), DbPack()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbGoTop()
   DbDelete()
   QOut( "Deleted: " + IIF( Deleted(), "YES", "NO" ) )
   DbRecall()
   DbCloseArea()

RETURN
