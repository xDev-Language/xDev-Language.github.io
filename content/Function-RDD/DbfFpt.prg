/*
 * $DOC$
 * $NAME$
 * DbfFpt()
 *
 * $ONELINER$
 * Initialize the DBFFPT database driver entry point
 *
 * $SYNTAX$
 * DbfFpt() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbfFpt() initializes the runtime entry point for the DBFFPT driver. It does
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
 * DbfCdx(), DbfDbt(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbfFpt()
   QOut( "DBFFPT runtime initialized" )

RETURN
