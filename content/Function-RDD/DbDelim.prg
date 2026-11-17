/*
 * $DOC$
 * $NAME$
 * DbDelim()
 *
 * $ONELINER$
 * Export records to or import records from a delimited text file
 *
 * $SYNTAX$
 * DbDelim( lExport, cFile, [cDelimiter], [aFields], [bFor], [bWhile], [nNext], [nRecord], [lRest] ) --> lSuccess
 *
 * $ARGUMENTS$
 * `lExport` `.T.` exports the current work area; `.F.` imports into it.
 * `cFile` Text file name. `cDelimiter` Field delimiter or a two-element delimiter array.
 * `aFields` Optional field list. Remaining arguments define the record scope.
 *
 * $RETURNS$
 * `.T.` when the operation succeeds; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * With lExport true, DbDelim() walks the current work area, selects aFields and
 * writes each scoped record to cFile using cDelimiter. With lExport false, it
 * reads rows, converts them to the destination field types and appends records.
 * The optional FOR, WHILE, NEXT, RECORD and REST arguments restrict the rows
 * processed. Navigation is used while transferring records and the destination
 * area is changed during import.
 *
 * $NOTES$
 * The current work area must be open and writable for import. Invalid fields,
 * delimiters, conversions, scopes or file access raise an error. DbDelim()
 * supports general delimited transfer; DbExportCsv() fixes UTF-8, BOM, header
 * and semicolon rules.
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
 * DbExportCsv(), DbImportCsv(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "delim_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "delim_demo.dbf", "People" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbCommit()
   QOut( "Exported: " + IIF( DbDelim( .T., "people.txt", "," ), "YES", "NO" ) )
   DbCloseArea()
   FErase( "delim_demo.dbf" )
   FErase( "people.txt" )


   RETURN
