/*
 * $DOC$
 * $NAME$
 * FieldBlock()
 *
 * $ONELINER$
 * Return a set-get block for a field
 *
 * $SYNTAX$
 * FieldBlock( cFieldName ) --> bFieldBlock
 *
 * $ARGUMENTS$
 * `cFieldName` Field name.
 *
 * $RETURNS$
 * A block that gets the field value with no argument and assigns it with one argument.
 *
 * $DESCRIPTION$
 * FieldBlock() creates a reusable block for reading or writing a field in the
 * current work area.
 *
 * $NOTES$
 * The field must exist in the current work area when the block is used.
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
 * FieldWBlock(), FieldGet(), FieldPut()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL bName

   DbUseArea( .T., , "people.dbf", "People" )
   bName := FieldBlock( "NAME" )
   QOut( "Name: " + RTrim( Eval( bName ) ) )
   DbCloseArea()

RETURN
