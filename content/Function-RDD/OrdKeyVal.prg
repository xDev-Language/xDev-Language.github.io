/*
 * $DOC$
 * $NAME$
 * OrdKeyVal()
 *
 * $ONELINER$
 * Return the current key value
 *
 * $SYNTAX$
 * OrdKeyVal() --> uKeyValue
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * Key value of the current record in the controlling order.
 *
 * $DESCRIPTION$
 * OrdKeyVal() evaluates the controlling order's key for the current record and returns it.
 *
 * $NOTES$
 * A controlling order must be active.
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
 * OrdKey(), OrdKeyNo(), DbSetOrder()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Key value: " + ValType( OrdKeyVal() ) )
   DbCloseArea()

RETURN
