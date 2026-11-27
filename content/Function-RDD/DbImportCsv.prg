/*
 * $DOC$
 * $NAME$
 * DbImportCsv()
 *
 * $ONELINER$
 * Import UTF-8 CSV records into the current work area
 *
 * $SYNTAX$
 * DbImportCsv( cFile ) --> nRecords
 *
 * $ARGUMENTS$
 * `cFile` CSV file whose header names match fields in the current work area.
 *
 * $RETURNS$
 * The number of records imported.
 *
 * $DESCRIPTION$
 * DbImportCsv() reads a UTF-8 CSV file and appends records to the current work
 * area. Columns are matched to fields by the names in the header row.
 *
 * $NOTES$
 * The current work area must be open and writable.
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
 * DbExportCsv(), DbAppend(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( DbImportCsv( "people.csv" ) )
   DbCloseArea()

   RETURN
