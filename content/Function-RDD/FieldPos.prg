/*
 * $DOC$
 * $NAME$
 * FieldPos()
 *
 * $ONELINER$
 * Return the position of a field
 *
 * $SYNTAX$
 * FieldPos( cFieldName ) --> nFieldPos
 *
 * $ARGUMENTS$
 * `cFieldName` Field name.
 *
 * $RETURNS$
 * One-based field position, or zero when the name is not present.
 *
 * $DESCRIPTION$
 * FieldPos() looks up a field name in the current work area's structure.
 *
 * $NOTES$
 * The lookup does not move the record pointer.
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
 * FieldName(), FieldGet(), FCount()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "NAME position: " + LTrim( Str( FieldPos( "NAME" ) ) ) )
   DbCloseArea()

RETURN
