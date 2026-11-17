/*
 * $DOC$
 * $NAME$
 * DbExportCsv()
 *
 * $ONELINER$
 * Export the current work area to UTF-8 CSV
 *
 * $SYNTAX$
 * DbExportCsv( cFile, [aFields], [bFor] ) --> nRecords
 *
 * $ARGUMENTS$
 * `cFile` Destination CSV file. `aFields` Optional field list. `bFor` Optional filter block.
 *
 * $RETURNS$
 * The number of records written.
 *
 * $DESCRIPTION$
 * DbExportCsv() writes the current work area as UTF-8 CSV with a BOM, semicolon
 * separators and a header row containing field names.
 *
 * $NOTES$
 * The current work area remains open.
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
 * DbDelim(), DbUseArea(), DbCount()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "csv_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "csv_demo.dbf", "People" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbCommit()
   QOut( "Exported records: " + LTrim( Str( DbExportCsv( "people.csv" ) ) ) )
   DbCloseArea()
   FErase( "csv_demo.dbf" )
   FErase( "people.csv" )


   RETURN
