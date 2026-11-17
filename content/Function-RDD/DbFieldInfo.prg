/*
 * $DOC$
 * $NAME$
 * DbFieldInfo()
 *
 * $ONELINER$
 * Return information about a field
 *
 * $SYNTAX$
 * DbFieldInfo( nInfoType, nFieldPos, [expNewSetting] ) --> uCurrentSetting
 *
 * $ARGUMENTS$
 * `nInfoType` Information selector. `nFieldPos` One-based field position.
 * `expNewSetting` Optional new setting; xDev currently exposes read-only information.
 *
 * $RETURNS$
 * The selected field information.
 *
 * $DESCRIPTION$
 * DbFieldInfo() queries metadata for a field in the current work area. The
 * selector is defined by the active RDD and determines the returned value.
 *
 * $NOTES$
 * A work area must be open and the field position must be valid.
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
 * AFields(), FieldName(), DbStruct()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "field_info_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "field_info_demo.dbf", "People" )
   QOut( "Field info type: " + ValType( DbFieldInfo( 1, 1 ) ) )
   DbCloseArea()
   FErase( "field_info_demo.dbf" )


   RETURN
