/*
 * $DOC$
 * $NAME$
 * FieldGet()
 *
 * $ONELINER$
 * Retrieve a field value by position
 *
 * $SYNTAX$
 * FieldGet( nField ) --> ValueField
 *
 * $ARGUMENTS$
 * `nField` One-based field position.
 *
 * $RETURNS$
 * The value of the selected field, or NIL for an invalid position.
 *
 * $DESCRIPTION$
 * FieldGet() reads a field from the current record using its ordinal position.
 *
 * $NOTES$
 * It does not change the record or field.
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
 * FieldPut(), FieldName(), FieldPos()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Field 1: " + RTrim( FieldGet( 1 ) ) )
   DbCloseArea()

RETURN
