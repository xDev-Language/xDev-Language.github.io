/*
 * $DOC$
 * $NAME$
 * OrdBagName()
 *
 * $ONELINER$
 * Return the order-bag name of an order
 *
 * $SYNTAX$
 * OrdBagName( nOrder | cOrderName ) --> cOrderBagName
 *
 * $ARGUMENTS$
 * Order number or order name.
 *
 * $RETURNS$
 * Order-bag filename, or an empty string when unavailable.
 *
 * $DESCRIPTION$
 * OrdBagName() returns the file containing the selected order in the current work area.
 *
 * $NOTES$
 * An order must be open and addressable.
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
 * OrdBagExt(), OrdName(), DbOrderInfo()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Bag: " + OrdBagName( 1 ) )
   DbCloseArea()

RETURN
