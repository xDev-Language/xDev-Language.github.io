/*
 * $DOC$
 * $NAME$
 * DbAppendFrom()
 *
 * $ONELINER$
 * Append selected records from another database file
 *
 * $SYNTAX$
 * DbAppendFrom( cFile, [aFields], [bFor], [bWhile], [nNext], [nRecord], [lRest], [cRDD] ) --> lSuccess
 *
 * $ARGUMENTS$
 * `cFile` Source database file.
 * `aFields` Optional list of field names to copy.
 * `bFor`, `bWhile`, `nNext`, `nRecord`, `lRest` Select the records in the source.
 * `cRDD` Optional database driver name.
 *
 * $RETURNS$
 * `.T.` when the records are appended successfully; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbAppendFrom() reads records from cFile and appends them to the current
 * work area. Field names in aFields limit the fields copied. Scope arguments
 * select which source records are processed.
 *
 * $NOTES$
 * The destination table must be open and writable. The source structure must
 * contain compatible fields.
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
 * DbAppend(), DbCopy(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()


   DbCreate( "from_source.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "from_source.dbf", "Source" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbCommit()
   DbCreate( "from_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "from_demo.dbf", "Demo" )
   QOut( "Copied: " + IIF( DbAppendFrom( "from_source.dbf" ), "YES", "NO" ) )
   QOut( "Records: " + LTrim( Str( RecCount() ) ) )
   DbCloseAll()
   FErase( "from_source.dbf" )
   FErase( "from_demo.dbf" )

   
   RETURN
