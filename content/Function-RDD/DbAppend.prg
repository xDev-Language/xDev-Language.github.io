/*
 * $DOC$
 * $NAME$
 * DbAppend()
 *
 * $ONELINER$
 * Append a new record to the current work area
 *
 * $SYNTAX$
 * DbAppend( [lReleaseRecLocks] ) --> NIL
 *
 * $ARGUMENTS$
 * `lReleaseRecLocks` Releases the current record locks before appending when true.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbAppend() adds a blank record to the table in the current work area and
 * makes it the current record. The new record can then be filled with FieldPut().
 *
 * $NOTES$
 * A read-only work area or an I/O failure raises an error. The optional flag
 * defaults to false.
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
 * DbCreate(), DbUseArea(), FieldPut(), DbCommit()
 *
 * $DOCEND$
 */

PROCEDURE Main()


   DbCreate( "append_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "append_demo.dbf", "Demo" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbCommit()
   QOut( "Records: " + LTrim( Str( RecCount() ) ) )
   QOut( "Name: " + RTrim( FieldGet( 1 ) ) )
   DbCloseArea()
   FErase( "append_demo.dbf" )


   RETURN
