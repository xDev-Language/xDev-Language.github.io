/*
 * $DOC$
 * $NAME$
 * Found()
 *
 * $ONELINER$
 * Determine whether the previous search succeeded
 *
 * $SYNTAX$
 * Found() --> lSuccess
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * `.T.` when the previous locate or seek found a record.
 *
 * $DESCRIPTION$
 * Found() reports the result of the previous search operation without moving the record pointer.
 *
 * $NOTES$
 * A new navigation operation can change the result.
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
 * DbSeek(), DbLocate(), DbContinue()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbLocate( {|| FIELD->NAME == "Anna" } )
   QOut( "Found: " + IIF( Found(), "YES", "NO" ) )
   DbCloseArea()

RETURN
