/*
 * $DOC$
 * $NAME$
 * DbSkip()
 *
 * $ONELINER$
 * Move relative to the current record
 *
 * $SYNTAX$
 * DbSkip( [nRecords] ) --> NIL
 *
 * $ARGUMENTS$
 * `nRecords` Number of visible records to move. The default is 1.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbSkip() moves the record pointer relative to its current position. Positive
 * values move forward and negative values move backward.
 *
 * $NOTES$
 * Filters, scopes and deleted-record settings affect navigation.
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
 * DbSkipper(), DbGoTop(), RecNo()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbGoTop()
   DbSkip( 1 )
   QOut( "Record: " + LTrim( Str( RecNo() ) ) )
   DbCloseArea()

RETURN
