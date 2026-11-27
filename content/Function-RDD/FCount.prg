/*
 * $DOC$
 * $NAME$
 * FCount()
 *
 * $ONELINER$
 * Return the number of fields in the current database file
 *
 * $SYNTAX$
 * FCount() --> nFields
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * Number of fields in the current work area.
 *
 * $DESCRIPTION$
 * FCount() returns the number of fields in the structure of the current work area.
 *
 * $NOTES$
 * With no open area it returns zero.
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
 * DbStruct(), FieldName(), AFields()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Fields: " + LTrim( Str( FCount() ) ) )
   DbCloseArea()

RETURN
