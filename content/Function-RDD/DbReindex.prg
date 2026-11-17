/*
 * $DOC$
 * $NAME$
 * DbReindex()
 *
 * $ONELINER$
 * Rebuild all active indexes
 *
 * $SYNTAX$
 * DbReindex() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbReindex() recreates every active index in the current work area's order
 * list from its stored key expression.
 *
 * $NOTES$
 * The work area must be open and its index files writable.
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
 * DbCreateIndex(), DbClearIndex(), DbOrderInfo()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbReindex()
   QOut( "DbReindex: OK" )
   DbCloseArea()

   RETURN
