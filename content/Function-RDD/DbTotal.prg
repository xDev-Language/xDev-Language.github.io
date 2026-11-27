/*
 * $DOC$
 * $NAME$
 * DbTotal()
 *
 * $ONELINER$
 * Summarize numeric fields by a key
 *
 * $SYNTAX$
 * DbTotal( cFile, bKey, [aFields], [bFor], [bWhile], [nNext], [nRecord], [lRest] ) --> lSuccess
 *
 * $ARGUMENTS$
 * `cFile` Destination file. `bKey` Grouping block. `aFields` Numeric fields to total.
 * Remaining arguments define the scope.
 *
 * $RETURNS$
 * `.T.` when the summary file is created; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbTotal() scans the current work area, applies its optional scope, evaluates
 * bKey for each selected record, and combines records with equal keys. It sums
 * the numeric fields named in aFields and writes one summary record per key to
 * cFile. The source area stays open, while its pointer is used during the scan.
 *
 * $NOTES$
 * cFile must be writable and aFields must name numeric fields. Invalid blocks,
 * scopes or structures raise an error. DbTotal() aggregates records; DbSort()
 * only orders them and DbSum() returns one scalar without creating a file.
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
 * DbSum(), DbSort(), DbCopy()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "sales.dbf", "Sales" )
   QOut( "Total file: " + IIF( DbTotal( "sales_total.dbf", {|| FIELD->CUSTOMER }, { "AMOUNT" } ), "OK", "ERROR" ) )
   DbCloseArea()
   FErase( "sales_total.dbf" )

RETURN
