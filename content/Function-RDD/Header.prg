/*
 * $DOC$
 * $NAME$
 * Header()
 *
 * $ONELINER$
 * Return the database header length
 *
 * $SYNTAX$
 * Header() --> nBytes
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * Header length in bytes, or zero without an open area.
 *
 * $DESCRIPTION$
 * Header() returns the size of the current database file header.
 *
 * $NOTES$
 * The value depends on the file structure and active RDD.
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
 * RecSize(), FCount(), DbStruct()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Header bytes: " + LTrim( Str( Header() ) ) )
   DbCloseArea()

RETURN
