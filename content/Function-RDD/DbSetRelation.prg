/*
 * $DOC$
 * $NAME$
 * DbSetRelation()
 *
 * $ONELINER$
 * Relate two work areas
 *
 * $SYNTAX$
 * DbSetRelation( nArea | cAlias, bExpr, cExpr ) --> NIL
 *
 * $ARGUMENTS$
 * `nArea | cAlias` Child work area. `bExpr` Link block. `cExpr` Optional text.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbSetRelation() stores a relation from the current parent area to the child
 * named by nArea or cAlias. When the parent moves, xDev evaluates bExpr in the
 * parent context and uses the result to reposition the child. cExpr records
 * the expression text for metadata and diagnostics. lScoped can limit the
 * child navigation to the parent key. The parent pointer is not moved by
 * setting the relation; later parent navigation can move the child pointer.
 *
 * $NOTES$
 * Both work areas must be open. The child should have a compatible controlling
 * order, otherwise relation movement may not find matching records. Invalid
 * aliases, area numbers, blocks or flags raise an error. DbSetRelation()
 * creates a normal relation; OrdSetRelation() additionally scopes the child
 * order and supports order-oriented navigation.
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
 * DbClearRelation(), DbRelation(), DbRSelect()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbUseArea( .T., , "orders.dbf", "Orders" )
   DbSelectArea( "People" )
   DbSetRelation( "Orders", {|| FIELD->ID}, "ID" )
   QOut( "Relation set" )
   DbCloseAll()

RETURN
