/*
 * $DOC$
 * $NAME$
 * DbSort()
 *
 * $ONELINER$
 * Copy selected records in sorted order
 *
 * $SYNTAX$
 * DbSort( cFile, aFields, [bFor], [bWhile], [nNext], [nRecord], [lRest] ) --> lSuccess
 *
 * $ARGUMENTS$
 * `cFile` Destination file. `aFields` Sort-field definitions. Remaining arguments define scope.
 *
 * $RETURNS$
 * `.T.` when the sorted file is created; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbSort() reads records from the current work area, applies the optional FOR,
 * WHILE and range scope, sorts the selected rows by the definitions in aFields,
 * and writes them to cFile. The source area remains open. Navigation is used
 * while collecting records, so the source pointer can be restored only as
 * defined by the active RDD; the new file receives no source indexes unless
 * the RDD creates them.
 *
 * $NOTES$
 * cFile must be writable and aFields must contain valid field definitions.
 * Invalid scopes, fields or file operations raise an error. DbSort() creates a
 * sorted copy; DbCopy() preserves source order and DbTotal() groups and sums data.
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
 * DbCopy(), DbTotal(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Sorted: " + IIF( DbSort( "people_sorted.dbf", { { "NAME", "C", 12, 0 } } ), "YES", "NO" ) )
   DbCloseArea()
   FErase( "people_sorted.dbf" )

RETURN
