/* $DOC$
 * $NAME$
 * OrdNumber()
 * $ONELINER$ Return the position of an order
 * $SYNTAX$ OrdNumber( cOrderName, [cOrderBagName] ) --> nOrderNo
 * $ARGUMENTS$ `cOrderName` Order name. `cOrderBagName` Optional bag file.
 * $RETURNS$ One-based order position, or zero when unavailable.
 * $DESCRIPTION$ Looks up an order name in the current order list.
 * $NOTES$ The lookup does not change the controlling order.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$ Functions RDD
 * $HEADER$
 * $SEEALSO$ OrdName(), OrdSetFocus(), DbOrderInfo()
 * $DOCEND$ */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Order number: " + LTrim( Str( OrdNumber( "NAME" ) ) ) )
   DbCloseArea()

RETURN
