/*
 * $DOC$
 * $NAME$
 * LastRec()
 *
 * $ONELINER$
 * Return the number of records in the current file
 *
 * $SYNTAX$
 * LastRec() --> nRecords
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * Number of records in the current database file.
 *
 * $DESCRIPTION$
 * LastRec() returns the physical record count of the current work area.
 *
 * $NOTES$
 * It is an alias-style count and does not depend on the current record position.
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
 * RecCount(), RecNo(), DbCount()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Records: " + LTrim( Str( LastRec() ) ) )
   DbCloseArea()

RETURN
