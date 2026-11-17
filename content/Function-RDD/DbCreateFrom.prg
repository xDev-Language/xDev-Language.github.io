/*
 * $DOC$
 * $NAME$
 * DbCreateFrom()
 *
 * $ONELINER$
 * Create a database file from an extended structure file
 *
 * $SYNTAX$
 * DbCreateFrom( cFile, cFrom, [cRDD], [lNew], [cAlias] ) --> lSuccess
 *
 * $ARGUMENTS$
 * `cFile` New database file name.
 * `cFrom` Extended structure file name.
 * `cRDD` Optional RDD name.
 * `lNew` Open the new file in a new work area when true.
 * `cAlias` Optional alias for the new area.
 *
 * $RETURNS$
 * `.T.` when the file is created successfully; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbCreateFrom() reads an extended structure file and creates a database file
 * with the described fields.
 *
 * $NOTES$
 * The structure file must be readable by the selected RDD.
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
 * DbCreate(), DbCopyXStruct()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "create_from_source.dbf", { { "NAME", "C", 12, 0 }, { "AGE", "N", 3, 0 } } )
   DbUseArea( .T., , "create_from_source.dbf", "Source" )
   DbCopyXStruct( "people_structure.dbf" )
   DbCloseArea()
   QOut( "Created: " + IIF( DbCreateFrom( "created_demo.dbf", "people_structure.dbf" ), "YES", "NO" ) )
   FErase( "create_from_source.dbf" )
   FErase( "created_demo.dbf" )
   FErase( "people_structure.dbf" )


   RETURN
