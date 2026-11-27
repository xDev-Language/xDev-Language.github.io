/*
 * $DOC$
 * $NAME$
 * DbFilePut()
 *
 * $ONELINER$
 * Insert the contents of a file into a field
 *
 * $SYNTAX$
 * DbFilePut( nFieldPos, cSourceFile ) --> lSuccess
 *
 * $ARGUMENTS$
 * `nFieldPos` One-based field position. `cSourceFile` Source file.
 *
 * $RETURNS$
 * `.T.` when the field is updated successfully; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbFilePut() reads an external file and stores its contents in the selected
 * field of the current record.
 *
 * $NOTES$
 * The current work area must be writable and the record must be valid.
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
 * DbFileGet(), FieldGet(), FieldPut()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "File put: " + IIF( DbFilePut( 1, "field.txt" ), "OK", "ERROR" ) )
   DbCloseArea()

   RETURN
