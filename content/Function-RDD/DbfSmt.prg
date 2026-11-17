/*
 * $DOC$
 * $NAME$
 * DbfSmt()
 *
 * $ONELINER$
 * Initialize the DBFSMT database driver entry point
 *
 * $SYNTAX$
 * DbfSmt() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbfSmt() initializes the runtime entry point for the DBFSMT driver. It does
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
 * DbfNtx(), DbfFpt(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbfSmt()
   QOut( "DBFSMT runtime initialized" )

   RETURN
