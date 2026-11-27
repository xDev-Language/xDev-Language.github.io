/*
 * $DOC$
 * $NAME$
 * FieldWBlock()
 *
 * $ONELINER$
 * Return a set-get block for a field in another work area
 *
 * $SYNTAX$
 * FieldWBlock( cFieldName, nWorkArea ) --> bFieldWBlock
 *
 * $ARGUMENTS$
 * `cFieldName` Field name. `nWorkArea` Target work-area number.
 *
 * $RETURNS$
 * A block that reads or assigns the named field in the specified work area.
 *
 * $DESCRIPTION$
 * FieldWBlock() creates a field block bound to a work area other than the current one.
 *
 * $NOTES$
 * The target area and field must exist when the block is used.
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
 * FieldBlock(), FieldGet(), FieldPut()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL bName

   DbUseArea( .T., , "people.dbf", "People" )
   bName := FieldWBlock( "NAME", Select() )
   QOut( "Name: " + RTrim( Eval( bName ) ) )
   DbCloseArea()

RETURN
