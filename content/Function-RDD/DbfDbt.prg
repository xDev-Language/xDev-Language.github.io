/*
 * $DOC$
 * $NAME$
 * DbfDbt()
 *
 * $ONELINER$
 * Initialize the DBFDBT database driver entry point
 *
 * $SYNTAX$
 * DbfDbt() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbfDbt() initializes the runtime entry point for the DBFDBT driver. It does
 * not open a database file.
 *
 * $NOTES$
 * Use DbUseArea() to open a file after choosing the driver.
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
 * DbfCdx(), DbfFpt(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbfDbt()
   QOut( "DBFDBT runtime initialized" )

RETURN
