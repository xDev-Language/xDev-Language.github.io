/*
 * $DOC$
 * $NAME$
 * DbSetIndex()
 *
 * $ONELINER$
 * Load an order bag into the current order list
 *
 * $SYNTAX$
 * DbSetIndex( cOrderBagName ) --> NIL
 *
 * $ARGUMENTS$
 * `cOrderBagName` Index or order-bag file name.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbSetIndex() opens cOrderBagName through the active RDD and appends its orders
 * to the current work area's order list. It does not rebuild keys or change
 * field data. The current record pointer stays in the same area, although a
 * later order selection can change navigation order.
 *
 * $NOTES$
 * The file must exist and be compatible with the active RDD. Invalid paths,
 * order names or file access raise an error. DbSetIndex() loads existing orders;
 * DbCreateIndex() and OrdCreate() build new ones.
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
 * DbClearIndex(), DbCreateIndex(), DbSetOrder()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbSetIndex( "people.ntx" )
   QOut( "Index loaded" )
   DbCloseArea()

RETURN
