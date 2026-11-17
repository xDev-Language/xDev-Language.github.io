/*
 * $DOC$
 * $NAME$
 * DbCloseAll()
 *
 * $ONELINER$
 * Close all occupied work areas
 *
 * $SYNTAX$
 * DbCloseAll() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbCloseAll() closes every open work area and its associated files. The
 * selected work area is reset to area 1 after all areas are closed.
 *
 * $NOTES$
 * Pending updates are committed according to the RDD close operation before
 * each area is released.
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
 * DbCloseArea(), DbCommitAll(), Select()
 *
 * $DOCEND$
 */

PROCEDURE Main()


   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Before close: " + IIF( Used(), "OPEN", "CLOSED" ) )
   DbCloseAll()
   QOut( "After close: " + IIF( Used(), "OPEN", "CLOSED" ) )


   RETURN
