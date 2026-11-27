/*
 * $DOC$
 * $NAME$
 * DbCommit()
 *
 * $ONELINER$
 * Flush pending updates in the current work area
 *
 * $SYNTAX$
 * DbCommit() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbCommit() writes pending record and structural updates of the current work
 * area to its database and index files. It keeps the work area open.
 *
 * $NOTES$
 * I/O failures raise a runtime error. Use DbCommitAll() to flush every area.
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
 * DbCommitAll(), DbAppend(), DbCloseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "commit_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "commit_demo.dbf", "People" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbCommit()
   QOut( "Saved: " + RTrim( FieldGet( 1 ) ) )
   DbCloseArea()
   FErase( "commit_demo.dbf" )


   RETURN
