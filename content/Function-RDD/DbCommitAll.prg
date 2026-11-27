/*
 * $DOC$
 * $NAME$
 * DbCommitAll()
 *
 * $ONELINER$
 * Flush pending updates in all work areas
 *
 * $SYNTAX$
 * DbCommitAll() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbCommitAll() writes pending updates in every open work area to its database
 * and index files. All areas remain open after the operation.
 *
 * $NOTES$
 * An I/O failure raises a runtime error.
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
 * DbCommit(), DbCloseAll()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "commit_all_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "commit_all_demo.dbf", "People" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbCommitAll()
   QOut( "Saved records: " + LTrim( Str( RecCount() ) ) )
   DbCloseAll()
   FErase( "commit_all_demo.dbf" )

RETURN
