/* $DOC$
 * $NAME$ OrdSetRelation()
 * $ONELINER$ Relate areas and scope the child order
 * $SYNTAX$ OrdSetRelation( nArea | cAlias, bExpr, [cExpr], [lScoped] ) --> NIL
 * $ARGUMENTS$ Child area, link block, optional expression text and scoped flag.
 * $RETURNS$ NIL.
 * $DESCRIPTION$ Relates the child area to the current parent, evaluates bExpr
 * as the parent moves, and scopes the child's controlling order to that key.
 * cExpr stores the textual link and lScoped controls whether the child remains
 * restricted to the current parent key. Setting the relation does not move the
 * parent pointer, but later parent navigation can reposition the child.
 * $NOTES$ Both areas must be open and the child needs a compatible order.
 * Invalid aliases, blocks, flags or missing orders raise an error. OrdSetRelation()
 * is order-aware; DbSetRelation() establishes the general area relation.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$ Functions RDD
 * $HEADER$
 * $SEEALSO$ DbSetRelation(), DbClearRelation(), OrdScope()
 * $DOCEND$ */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbUseArea( .T., , "orders.dbf", "Orders" )
   DbSelectArea( "People" )
   OrdSetRelation( "Orders", {|| FIELD->ID }, "ID", .T. )
   QOut( "Order relation set" )
   DbCloseAll()

RETURN
