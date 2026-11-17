/* $DOC$
 * $NAME$ OrdSetFocus()
 * $ONELINER$ Set the controlling order
 * $SYNTAX$ OrdSetFocus( [cOrderName | nOrder], [cOrderBagName] ) --> cPrevOrderNameInFocus
 * $ARGUMENTS$ Optional order selector and bag file.
 * $RETURNS$ Previously focused order name.
 * $DESCRIPTION$ Selects an order by name or position, optionally within a
 * specified bag, and makes it controlling for navigation and searches. The
 * record pointer stays in the current area, while the logical order used by
 * later operations changes. The function returns the previous order name.
 * $NOTES$ The selected order must be loaded. Invalid names, positions, bags or
 * missing areas raise an error. DbSetOrder() selects only by numeric position.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$ Functions RDD
 * $HEADER$
 * $SEEALSO$ DbSetOrder(), OrdName(), DbSeek()
 * $DOCEND$ */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Previous order: " + OrdSetFocus( 1 ) )
   DbCloseArea()

RETURN
