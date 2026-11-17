/*
 * $DOC$
 * $NAME$
 * DbOrderInfo()
 *
 * $ONELINER$
 * Return or change information about an order
 *
 * $SYNTAX$
 * DbOrderInfo( nInfoType, [cIndexFile], [cOrder | nPosition], [expNewSetting] ) --> uCurrentSetting
 *
 * $ARGUMENTS$
 * `nInfoType` Selector. `cIndexFile` Index file. `cOrder | nPosition` Order name or position.
 * `expNewSetting` Optional new value supported by the selector.
 *
 * $RETURNS$
 * The selected order information or previous setting.
 *
 * $DESCRIPTION$
 * DbOrderInfo() queries the active order list and index files of the current
 * work area. Selectors are defined by the RDD headers.
 *
 * $NOTES$
 * A work area must be open.
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
 * OrdName(), OrdNumber(), OrdSetFocus()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "DbOrderInfo: " + ValType( DbOrderInfo( 1 ) ) )
   DbCloseArea()

   RETURN
