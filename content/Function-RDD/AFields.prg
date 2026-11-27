/*
 * $DOC$
 * $NAME$
 * AFields()
 *
 * $ONELINER$
 * Fill arrays with the structure of the current database file
 *
 * $SYNTAX$
 * AFields( [aFieldNames], [aTypes], [aWidths], [aDecimals] ) --> nFields
 *
 * $ARGUMENTS$
 * `aFieldNames` Optional array to receive field names.
 * `aTypes` Optional array to receive one-character field type codes.
 * `aWidths` Optional array to receive field lengths in bytes.
 * `aDecimals` Optional array to receive the number of decimal places.
 *
 * $RETURNS$
 * The number of elements filled in each supplied array. This is the smaller
 * of the field count and the length of the shortest supplied array.
 * Returns 0 if no array is supplied or no table is open in the current work area.
 *
 * $DESCRIPTION$
 * AFields() copies the structure of the table in the current work area into
 * existing arrays. Elements correspond to fields in their physical order,
 * starting at element 1. Each array receives one property of the fields.
 *
 * The arrays are modified directly. They do not need to be passed with @.
 * AFields() does not create or resize them. Allocate enough elements before
 * calling the function. Elements beyond the returned count remain unchanged.
 *
 * Any argument can be omitted or passed as NIL. Arguments that are not arrays
 * are ignored. Only supplied arrays determine how many elements are filled.
 *
 * $NOTES$
 * An empty supplied array makes the function return 0 without filling any array.
 * Use FCount() to obtain the field count without supplying arrays, or DbStruct()
 * to obtain the whole structure as an array of field descriptions.
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
 * DbStruct(), FCount(), FieldName(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()


   LOCAL aNames    := Array( 3 )
   LOCAL aTypes    := Array( 3 )
   LOCAL aWidths   := Array( 3 )
   LOCAL aDecimals := Array( 3 )
   LOCAL nFields
   LOCAL nField

   DbCreate( "afields_people.dbf", ;
      { { "NAME", "C", 20, 0 }, { "BORN", "D", 8, 0 }, { "SALARY", "N", 10, 2 } } )

   DbUseArea( .T., , "afields_people.dbf", "People" )

   nFields := AFields( aNames, aTypes, aWidths, aDecimals )

   QOut( "Fields: " + LTrim( Str( nFields ) ) )
   FOR nField := 1 TO nFields
      QOut( aNames[ nField ] + " " + aTypes[ nField ] + " " + ;
         LTrim( Str( aWidths[ nField ] ) ) + " " + ;
         LTrim( Str( aDecimals[ nField ] ) ) )
   NEXT

   DbCloseArea()
   FErase( "afields_people.dbf" )


   RETURN
