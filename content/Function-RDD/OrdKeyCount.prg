/*
 * $DOC$
 * $NAME$
 * OrdKeyCount()
 *
 * $ONELINER$
 * Return the number of keys in an order
 *
 * $SYNTAX$
 * OrdKeyCount( [cOrder | nPosition], [cIndexFile] ) --> nKeys
 *
 * $ARGUMENTS$
 * Optional order selector and index file.
 *
 * $RETURNS$
 * Number of keys in the selected order.
 *
 * $DESCRIPTION$
 * OrdKeyCount() returns the count of keys stored in an order.
 *
 * $NOTES$
 * The count can differ from the physical record count when an order is scoped or filtered.
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
 * OrdKeyNo(), DbCount(), OrdSetFocus()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Keys: " + LTrim( Str( OrdKeyCount( 1 ) ) ) )
   DbCloseArea()

RETURN
