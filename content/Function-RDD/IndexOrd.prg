/*
 * $DOC$
 * $NAME$
 * IndexOrd()
 *
 * $ONELINER$
 * Return the controlling index position
 *
 * $SYNTAX$
 * IndexOrd() --> nOrder
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * Position of the controlling order, or zero when none is active.
 *
 * $DESCRIPTION$
 * IndexOrd() reports the order-list position of the index controlling navigation.
 *
 * $NOTES$
 * The result belongs to the current work area.
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
 * IndexKey(), DbSetOrder(), OrdSetFocus()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Order: " + LTrim( Str( IndexOrd() ) ) )
   DbCloseArea()

RETURN
