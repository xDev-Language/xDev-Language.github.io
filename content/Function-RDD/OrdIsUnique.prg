/*
 * $DOC$
 * $NAME$
 * OrdIsUnique()
 *
 * $ONELINER$
 * Return the unique flag of an order
 *
 * $SYNTAX$
 * OrdIsUnique( [cOrder | nPosition], [cIndexFile] ) --> lUnique
 *
 * $ARGUMENTS$
 * Optional order selector and index file.
 *
 * $RETURNS$
 * `.T.` for a unique order; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * OrdIsUnique() reports whether the selected order rejects duplicate keys.
 *
 * $NOTES$
 * The order must be available in the current work area.
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
 * OrdCreate(), OrdDescend(), OrdKey()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Unique: " + IIF( OrdIsUnique( 1 ), "YES", "NO" ) )
   DbCloseArea()

RETURN
