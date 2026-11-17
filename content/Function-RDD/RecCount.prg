/* $DOC$
 * $NAME$ RecCount()
 * $ONELINER$ Return the number of records
 * $SYNTAX$ RecCount() --> nRecords
 * $ARGUMENTS$ None.
 * $RETURNS$ Number of records in the current file.
 * $DESCRIPTION$ RecCount() returns the physical record count of the current work area.
 * $NOTES$ With no open area it returns zero.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$ Functions RDD
 * $HEADER$
 * $SEEALSO$ LastRec(), RecNo(), DbCount()
 * $DOCEND$ */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Records: " + LTrim( Str( RecCount() ) ) )
   DbCloseArea()

RETURN
