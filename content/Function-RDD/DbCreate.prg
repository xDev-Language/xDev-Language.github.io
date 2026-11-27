/*
 * $DOC$
 * $NAME$
 * DbCreate()
 *
 * $ONELINER$
 * Create a database file from a structure array
 *
 * $SYNTAX$
 * DbCreate( cDatabase, aStruct, [cDriver], [lNewArea], [cAlias], [xDelimiter], [nConnection] ) --> NIL
 *
 * $ARGUMENTS$
 * `cDatabase` Database file name.
 * `aStruct` Array of field definitions: name, type, length and decimals.
 * `cDriver` Optional RDD name.
 * `lNewArea` Open the new file in a new work area when true.
 * `cAlias` Optional alias for the new area.
 * `xDelimiter` Optional driver-specific delimiter setting.
 * `nConnection` Optional connection number; xDev accepts zero.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbCreate() creates a database file using a structure array. Each field
 * definition is an array containing its name, type, length and decimals.
 *
 * $NOTES$
 * The file is created by the selected RDD. Invalid structures or file errors
 * raise a runtime error.
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
 * DbCreateFrom(), DbUseArea(), DbCopyStruct()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "create_demo.dbf", { { "NAME", "C", 12, 0 }, { "AGE", "N", 3, 0 } } )
   DbUseArea( .T., , "create_demo.dbf", "Demo" )
   QOut( "Fields created: " + LTrim( Str( FCount() ) ) )
   DbCloseArea()
   FErase( "create_demo.dbf" )


   RETURN
