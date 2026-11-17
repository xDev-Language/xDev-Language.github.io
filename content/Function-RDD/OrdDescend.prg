/*
 * $DOC$
 * $NAME$
 * OrdDescend()
 *
 * $ONELINER$
 * Return or change an order's descending flag
 *
 * $SYNTAX$
 * OrdDescend( [cOrder | nPosition], [cIndexFile], [lNewDescend] ) --> lCurrentDescend
 *
 * $ARGUMENTS$
 * Optional order selector, index file and new descending flag.
 *
 * $RETURNS$
 * Current or previous descending state.
 *
 * $DESCRIPTION$
 * OrdDescend() reads or changes the direction of an order in the current work area.
 *
 * $NOTES$
 * An order must be available.
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
 * OrdSetFocus(), OrdIsUnique(), DbSetOrder()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Descending: " + IIF( OrdDescend( 1 ), "YES", "NO" ) )
   DbCloseArea()

RETURN
