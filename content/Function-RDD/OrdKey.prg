/*
 * $DOC$
 * $NAME$
 * OrdKey()
 *
 * $ONELINER$
 * Return the key expression of an order
 *
 * $SYNTAX$
 * OrdKey( cOrderName | nOrder, [cOrderBagName] ) --> cExpKey
 *
 * $ARGUMENTS$
 * Order name or number and optional order-bag file.
 *
 * $RETURNS$
 * Key expression text.
 *
 * $DESCRIPTION$
 * OrdKey() returns the expression used to calculate keys for the selected order.
 *
 * $NOTES$
 * The order must exist in the current order list.
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
 * IndexKey(), OrdFor(), OrdName()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Key: " + OrdKey( 1 ) )
   DbCloseArea()

RETURN
