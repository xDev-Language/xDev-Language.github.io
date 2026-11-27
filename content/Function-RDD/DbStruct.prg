/*
 * $DOC$
 * $NAME$
 * DbStruct()
 *
 * $ONELINER$
 * Return the structure of the current database file
 *
 * $SYNTAX$
 * DbStruct() --> aStruct
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * An array of field arrays containing name, type, length and decimals.
 *
 * $DESCRIPTION$
 * DbStruct() returns the complete physical structure of the current work area.
 * Each row describes one field in field order.
 *
 * $NOTES$
 * With no open area it returns an empty array.
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
 * AFields(), FCount(), FieldName()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "struct_demo.dbf", { { "NAME", "C", 12, 0 }, { "AGE", "N", 3, 0 } } )
   DbUseArea( .T., , "struct_demo.dbf", "Demo" )
   QOut( "Fields: " + LTrim( Str( Len( DbStruct() ) ) ) )
   DbCloseArea()
   FErase( "struct_demo.dbf" )

RETURN
