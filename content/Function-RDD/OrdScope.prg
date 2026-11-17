/* $DOC$
 * $NAME$
 * OrdScope()
 * $ONELINER$ Set or return order-scope boundaries
 * $SYNTAX$ OrdScope( nScope, [expNewValue] ) --> uCurrentValue
 * $ARGUMENTS$ `nScope` Scope selector. `expNewValue` Optional boundary value.
 * $RETURNS$ Current scope value.
 * $DESCRIPTION$ Reads or sets a boundary for key values in the controlling order.
 * $NOTES$ The meaning of nScope is defined by the RDD constants.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$ Functions RDD
 * $HEADER$
 * $SEEALSO$ OrdSetFocus(), OrdKeyVal(), DbSeek()
 * $DOCEND$ */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Scope value type: " + ValType( OrdScope( 0 ) ) )
   DbCloseArea()

RETURN
