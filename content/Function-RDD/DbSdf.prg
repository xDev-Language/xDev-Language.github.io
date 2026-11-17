/*
 * $DOC$
 * $NAME$
 * DbSdf()
 *
 * $ONELINER$
 * Export records to or import records from fixed-width text
 *
 * $SYNTAX$
 * DbSdf( lExport, cFile, [aFields], [bFor], [bWhile], [nNext], [nRecord], [lRest] ) --> lSuccess
 *
 * $ARGUMENTS$
 * `lExport` Selects export or import. `cFile` Text file name.
 * `aFields` Optional fields. Remaining arguments define the record scope.
 *
 * $RETURNS$
 * `.T.` when the operation succeeds; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * With lExport true, DbSdf() writes scoped records using the widths and order
 * of the selected database fields. With lExport false, it reads fixed-width
 * lines, converts each slice and appends records to the current area. aFields
 * chooses the fields; FOR, WHILE, NEXT, RECORD and REST restrict the transfer.
 * The record pointer is used during the scan and import changes the destination
 * contents.
 *
 * $NOTES$
 * The area must be open and writable for import. Invalid widths, fields,
 * conversions, scopes or file access raise an error. DbSdf() uses fixed-width
 * records; DbDelim() uses separators and DbExportCsv() uses a defined CSV format.
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
 * DbDelim(), DbExportCsv(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Export: " + IIF( DbSdf( .T., "people.sdf" ), "OK", "ERROR" ) )
   DbCloseArea()
   FErase( "people.sdf" )

RETURN
