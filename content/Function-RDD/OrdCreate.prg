/*
 * $DOC$
 * $NAME$
 * OrdCreate()
 *
 * $ONELINER$
 * Create an order in an order bag
 *
 * $SYNTAX$
 * OrdCreate( cOrderBagName, [cOrderName], cExpKey, bExpKey, [lUnique] ) --> NIL
 *
 * $ARGUMENTS$
 * `cOrderBagName` Bag file. `cOrderName` Optional order name. `cExpKey` Key text.
 * `bExpKey` Key block. `lUnique` Optional unique flag.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * OrdCreate() evaluates bExpKey for records in the current work area, stores
 * the resulting order in cOrderBagName, and optionally assigns cOrderName.
 * cExpKey is retained as metadata and lUnique controls duplicate keys. The
 * area remains open; its pointer is used while keys are generated.
 *
 * $NOTES$
 * The work area must be open and writable. Invalid expressions, blocks, bags or
 * duplicate unique keys raise an error. OrdCreate() creates an order in a bag;
 * DbCreateIndex() is the lower-level single-index form.
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
 * DbCreateIndex(), OrdDestroy(), OrdSetFocus()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   OrdCreate( "people.ntx", "NAME", "NAME", {|| FIELD->NAME } )
   QOut( "Order created: " + OrdName( 1 ) )
   DbCloseArea()

RETURN
