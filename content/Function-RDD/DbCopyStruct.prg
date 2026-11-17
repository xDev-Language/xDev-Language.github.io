/*
 * $DOC$
 * $NAME$
 * DbCopyStruct()
 *
 * $ONELINER$
 * Create an empty file from the current table structure
 *
 * $SYNTAX$
 * DbCopyStruct( cFile, [aFields] ) --> lSuccess
 *
 * $ARGUMENTS$
 * `cFile` Destination database file.
 * `aFields` Optional list of fields to include.
 *
 * $RETURNS$
 * `.T.` when the file is created successfully; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbCopyStruct() copies the structure of the current work area into a new,
 * empty database file. Records are never copied.
 *
 * $NOTES$
 * The current work area remains open and unchanged.
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
 * DbCopy(), DbCreate(), AFields()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "copy_struct_source.dbf", { { "NAME", "C", 12, 0 }, { "AGE", "N", 3, 0 } } )
   DbUseArea( .T., , "copy_struct_source.dbf", "People" )
   QOut( "Structure copied: " + IIF( DbCopyStruct( "people_empty.dbf" ), "YES", "NO" ) )
   DbCloseArea()
   FErase( "copy_struct_source.dbf" )
   FErase( "people_empty.dbf" )


   RETURN
