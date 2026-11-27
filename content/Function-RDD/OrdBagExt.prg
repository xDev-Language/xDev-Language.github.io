/*
 * $DOC$
 * $NAME$
 * OrdBagExt()
 *
 * $ONELINER$
 * Return the default order-bag extension
 *
 * $SYNTAX$
 * OrdBagExt() --> cBagExt
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * Default order-bag filename extension.
 *
 * $DESCRIPTION$
 * OrdBagExt() returns the extension used for order-bag files by the active RDD.
 *
 * $NOTES$
 * The extension does not include a leading period.
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
 * IndexExt(), OrdBagName(), OrdCreate()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( "Order bag extension: " + OrdBagExt() )

RETURN
