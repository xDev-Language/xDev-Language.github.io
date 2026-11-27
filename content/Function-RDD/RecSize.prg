/* $DOC$
 * $NAME$
 * RecSize()
 * $ONELINER$
 * Return the record length
 * $SYNTAX$
 * RecSize() --> nBytes
 * $ARGUMENTS$
 * None.
 * $RETURNS$
 * Record length in bytes.
 * $DESCRIPTION$
 * RecSize() returns the byte length of one database record.
 * $NOTES$
 * With no open area it returns zero.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$
 * Functions RDD
 * $HEADER$
 * $SEEALSO$
 * Header(), FCount(), DbStruct()
 * $DOCEND$
 * */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Record bytes: " + LTrim( Str( RecSize() ) ) )
   DbCloseArea()

RETURN
