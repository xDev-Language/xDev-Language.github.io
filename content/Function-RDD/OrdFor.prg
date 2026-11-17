/*
 * $DOC$
 * $NAME$
 * OrdFor()
 *
 * $ONELINER$
 * Return the FOR expression of an order
 *
 * $SYNTAX$
 * OrdFor( cOrderName | nOrder, [cOrderBagName] ) --> cForExp
 *
 * $ARGUMENTS$
 * Order name or number and optional order-bag file.
 *
 * $RETURNS$
 * FOR expression text, or an empty string when none is defined.
 *
 * $DESCRIPTION$
 * OrdFor() returns the condition stored with the selected order.
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
 * OrdCondSet(), OrdKey(), OrdName()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "FOR: " + OrdFor( 1 ) )
   DbCloseArea()

RETURN
