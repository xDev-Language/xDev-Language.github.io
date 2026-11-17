/*
 * $DOC$
 * $NAME$
 * DbfNtx()
 *
 * $ONELINER$
 * Initialize the DBFNTX database driver entry point
 *
 * $SYNTAX$
 * DbfNtx() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbfNtx() initializes the runtime entry point for the DBFNTX driver. It does
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
 * DbfCdx(), DbfSmt(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbfNtx()
   QOut( "DBFNTX runtime initialized" )

   RETURN
