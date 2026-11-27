/*
 * $DOC$
 * $NAME$
 * DbfCdx()
 *
 * $ONELINER$
 * Initialize the DBFCDX database driver entry point
 *
 * $SYNTAX$
 * DbfCdx() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbfCdx() initializes the RDD runtime used by the DBFCDX driver. It is an
 * entry point for driver registration and does not open a table itself.
 *
 * $NOTES$
 * Normal applications usually select the driver through DbUseArea() or RDD settings.
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
 * DbUseArea(), RddSetDefault(), DbfDbt()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbfCdx()
   QOut( "DBFCDX runtime initialized" )

RETURN
