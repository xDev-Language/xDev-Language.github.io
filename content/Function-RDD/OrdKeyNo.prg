/*
 * $DOC$
 * $NAME$
 * OrdKeyNo()
 *
 * $ONELINER$
 * Return the current key position in an order
 *
 * $SYNTAX$
 * OrdKeyNo( [cOrder | nPosition], [cIndexFile] ) --> nKeyNo
 *
 * $ARGUMENTS$
 * Optional order selector and index file.
 *
 * $RETURNS$
 * Logical position of the current record in the selected order.
 *
 * $DESCRIPTION$
 * OrdKeyNo() returns the current record's position within the selected order.
 *
 * $NOTES$
 * The result is order-relative rather than a physical record identity.
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
 * OrdKeyCount(), RecNo(), DbSeek()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Key position: " + LTrim( Str( OrdKeyNo( 1 ) ) ) )
   DbCloseArea()

RETURN
