/*
 * $DOC$
 * $NAME$
 * DbFileGet()
 *
 * $ONELINER$
 * Insert the contents of a field into a file
 *
 * $SYNTAX$
 * DbFileGet( nFieldPos, cTargetFile, nMode ) --> lSuccess
 *
 * $ARGUMENTS$
 * `nFieldPos` One-based field position. `cTargetFile` Destination file.
 * `nMode` Optional transfer mode, 0 or 1.
 *
 * $RETURNS$
 * `.T.` when the field contents are written successfully; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbFileGet() writes the contents of the selected field of the current record
 * to an external file. It is intended for file-backed field values.
 *
 * $NOTES$
 * The current work area and record must be valid.
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
 * DbFilePut(), FieldGet(), FieldPut()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "File get: " + IIF( DbFileGet( 1, "field.txt", 0 ), "OK", "ERROR" ) )
   DbCloseArea()
   FErase( "field.txt" )

   RETURN
