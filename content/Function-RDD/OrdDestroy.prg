/*
 * $DOC$
 * $NAME$
 * OrdDestroy()
 *
 * $ONELINER$
 * Remove an order from an order bag
 *
 * $SYNTAX$
 * OrdDestroy( cOrderName, [cOrderBagName] ) --> NIL
 *
 * $ARGUMENTS$
 * `cOrderName` Order name or position. `cOrderBagName` Optional bag file.
 *
 * $RETURNS$
 * `.T.` when the order is removed; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * OrdDestroy() removes the selected order from its order bag and current order list.
 *
 * $NOTES$
 * The operation changes the index file.
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
 * OrdCreate(), DbClearIndex(), OrdListClear()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Destroyed: " + IIF( OrdDestroy( "NAME" ), "YES", "NO" ) )
   DbCloseArea()

RETURN
