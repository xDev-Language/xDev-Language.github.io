/*
 * $DOC$
 * $NAME$
 * DbCopyXStruct()
 *
 * $ONELINER$
 * Save the current table structure in an extended structure file
 *
 * $SYNTAX$
 * DbCopyXStruct( cFile ) --> lSuccess
 *
 * $ARGUMENTS$
 * `cFile` Destination extended structure file.
 *
 * $RETURNS$
 * `.T.` when the file is written successfully; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbCopyXStruct() writes the structure of the current work area to an extended
 * structure file. The file can later be used by DbCreateFrom().
 *
 * $NOTES$
 * No records are copied.
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
 * DbCreateFrom(), DbCopyStruct()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "xstruct_source.dbf", { { "NAME", "C", 12, 0 }, { "AGE", "N", 3, 0 } } )
   DbUseArea( .T., , "xstruct_source.dbf", "People" )
   QOut( "Extended structure: " + IIF( DbCopyXStruct( "people_structure.dbf" ), "YES", "NO" ) )
   DbCloseArea()
   FErase( "xstruct_source.dbf" )
   FErase( "people_structure.dbf" )


   RETURN
