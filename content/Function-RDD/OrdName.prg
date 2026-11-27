/* $DOC$
 * $NAME$
 * OrdName()
 * $ONELINER$
 * Return the name of an order
 * $SYNTAX$
 * OrdName( nOrder, [cOrderBagName] ) --> cOrderName
 * $ARGUMENTS$
 * `nOrder` Order position. `cOrderBagName` Optional bag file.
 * $RETURNS$
 * Order name, or an empty string when unavailable.
 * $DESCRIPTION$
 * Returns the name at a position in the current order list.
 * $NOTES$
 * The position is one-based.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$
 * Functions RDD
 * $HEADER$
 * $SEEALSO$
 * OrdNumber(), OrdListAdd(), OrdSetFocus()
 * $DOCEND$
 * */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Order name: " + OrdName( 1 ) )
   DbCloseArea()

RETURN
