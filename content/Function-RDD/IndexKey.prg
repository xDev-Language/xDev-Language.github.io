/*
 * $DOC$
 * $NAME$
 * IndexKey()
 *
 * $ONELINER$
 * Return the key expression of an index
 *
 * $SYNTAX$
 * IndexKey( nOrder ) --> cKeyExp
 *
 * $ARGUMENTS$
 * `nOrder` Optional order number or name.
 *
 * $RETURNS$
 * Key expression text, or an empty string when unavailable.
 *
 * $DESCRIPTION$
 * IndexKey() returns the expression used to calculate keys for the selected index.
 *
 * $NOTES$
 * An index must be open in the current work area.
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
 * IndexOrd(), OrdKey(), DbOrderInfo()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Key: " + IndexKey( 1 ) )
   DbCloseArea()

RETURN
