/* $DOC$
 * $NAME$
 * OrdListAdd()
 * $ONELINER$ Add orders from an order bag
 * $SYNTAX$ OrdListAdd( cOrderBagName, [cOrderName] ) --> NIL
 * $ARGUMENTS$ `cOrderBagName` Order-bag file. `cOrderName` Optional order name.
 * $RETURNS$ NIL.
 * $DESCRIPTION$ Adds an existing order bag, or one order from it, to the current order list.
 * $NOTES$ The bag must be compatible with the current RDD.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$ Functions RDD
 * $HEADER$
 * $SEEALSO$ OrdListClear(), OrdListRebuild(), DbSetIndex()
 * $DOCEND$ */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   OrdListAdd( "people.ntx" )
   QOut( "Order list updated" )
   DbCloseArea()

RETURN
