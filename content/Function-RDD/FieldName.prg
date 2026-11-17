/*
 * $DOC$
 * $NAME$
 * FieldName()
 *
 * $ONELINER$
 * Return a field name by position
 *
 * $SYNTAX$
 * FieldName( nPosition ) --> cFieldName
 *
 * $ARGUMENTS$
 * `nPosition` One-based field position.
 *
 * $RETURNS$
 * Field name, or an empty string for an invalid position.
 *
 * $DESCRIPTION$
 * FieldName() returns the name of a field in the current work area by its position.
 *
 * $NOTES$
 * It does not change the current record.
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
 * FieldPos(), FCount(), DbStruct()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Field 1: " + FieldName( 1 ) )
   DbCloseArea()

RETURN
