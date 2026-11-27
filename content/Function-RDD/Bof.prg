/*
 * $DOC$
 * $NAME$
 * Bof()
 *
 * $ONELINER$
 * Determine whether the record pointer is at the beginning of the file
 *
 * $SYNTAX$
 * Bof() --> lBoundary
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * `.T.` when the current work area is at beginning of file, otherwise `.F.`.
 * With no open work area, returns `.T.`.
 *
 * $DESCRIPTION$
 * Bof() reports the beginning-of-file state of the current work area. Moving
 * before the first record, or opening an empty table, sets this state.
 *
 * $NOTES$
 * Bof() does not move the record pointer.
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
 * DbGoTop(), DbSkip(), Eof(), RecNo()
 *
 * $DOCEND$
 */

PROCEDURE Main()


   DbCreate( "bof_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "bof_demo.dbf", "Demo" )
   QOut( "At BOF: " + IIF( Bof(), "YES", "NO" ) )
   DbAppend()
   DbGoTop()
   QOut( "After first record: " + IIF( Bof(), "YES", "NO" ) )
   DbCloseArea()
   FErase( "bof_demo.dbf" )

   
   RETURN
