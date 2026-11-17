/*
 * $DOC$
 * $NAME$
 * FieldPut()
 *
 * $ONELINER$
 * Set a field value by position
 *
 * $SYNTAX$
 * FieldPut( nField, expAssign ) --> ValueAssigned
 *
 * $ARGUMENTS$
 * `nField` One-based field position. `expAssign` New field value.
 *
 * $RETURNS$
 * The value assigned to the field.
 *
 * $DESCRIPTION$
 * FieldPut() writes expAssign into a field of the current record by ordinal position.
 *
 * $NOTES$
 * The work area must be writable. Call DbCommit() to flush the update.
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
 * FieldGet(), DbAppend(), DbCommit()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Assigned: " + RTrim( FieldPut( 1, "Anna" ) ) )
   DbCommit()
   DbCloseArea()

RETURN
