/*
 * $DOC$
 * $NAME$
 * DbCloseArea()
 *
 * $ONELINER$
 * Close the current work area
 *
 * $SYNTAX$
 * DbCloseArea() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbCloseArea() closes the current work area and releases its database and
 * index files. The current selection remains the same work-area number.
 *
 * $NOTES$
 * Calling it when no area is open has no effect.
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
 * DbCloseAll(), DbUseArea(), Used()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbCloseArea()
   QOut( "Open after close: " + IIF( Used(), "YES", "NO" ) )

RETURN
