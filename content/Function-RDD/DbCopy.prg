/*
 * $DOC$
 * $NAME$
 * DbCopy()
 *
 * $ONELINER$
 * Copy selected records to a new database file
 *
 * $SYNTAX$
 * DbCopy( cFile, [aFields], [bFor], [bWhile], [nNext], [nRecord], [lRest], [cRDD] ) --> lSuccess
 *
 * $ARGUMENTS$
 * `cFile` Destination database file.
 * `aFields` Optional field-name list.
 * `bFor`, `bWhile`, `nNext`, `nRecord`, `lRest` Optional record-scope controls.
 * `cRDD` Optional database driver name.
 *
 * $RETURNS$
 * `.T.` when the file is created successfully; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbCopy() creates a new database file with the selected fields and copies the
 * records selected by the scope arguments from the current work area.
 *
 * $NOTES$
 * The destination file must be writable. The current work area stays open.
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
 * DbCopyStruct(), DbAppendFrom(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "copy_source.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "copy_source.dbf", "People" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbCommit()
   QOut( "Copied: " + IIF( DbCopy( "people_copy.dbf" ), "YES", "NO" ) )
   DbCloseArea()
   FErase( "copy_source.dbf" )
   FErase( "people_copy.dbf" )


   RETURN
