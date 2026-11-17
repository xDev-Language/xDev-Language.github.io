/*
 * $DOC$
 * $NAME$
 * DbSetOrder()
 *
 * $ONELINER$
 * Set the controlling order
 *
 * $SYNTAX$
 * DbSetOrder( nOrderNum ) --> NIL
 *
 * $ARGUMENTS$
 * `nOrderNum` Position of the order in the current order list.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbSetOrder() selects nOrderNum from the current order list as the controlling
 * order. It changes the order used by DbSkip(), DbSeek() and related navigation;
 * it does not rewrite records or move the pointer by itself.
 *
 * $NOTES$
 * The order must already be present in the order list. An invalid number or
 * closed area raises an error. DbSetOrder() selects by position; OrdSetFocus()
 * can select by name or position and returns the previous order name.
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
 * DbSetIndex(), DbSeek(), OrdSetFocus()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbSetOrder( 1 )
   QOut( "Order set" )
   DbCloseArea()

RETURN
