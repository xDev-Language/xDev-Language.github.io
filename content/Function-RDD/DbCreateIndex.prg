/*
 * $DOC$
 * $NAME$
 * DbCreateIndex()
 *
 * $ONELINER$
 * Create an index for the current work area
 *
 * $SYNTAX$
 * DbCreateIndex( cIndexName, cKeyExpr, bKeyExpr, [lUnique] ) --> NIL
 *
 * $ARGUMENTS$
 * `cIndexName` Optional index file name.
 * `cKeyExpr` Key expression text.
 * `bKeyExpr` Block returning the key value for a record.
 * `lUnique` Create a unique index when true.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbCreateIndex() evaluates bKeyExpr for records in the current work area,
 * writes the resulting keys to cIndexName, and adds the new index to the
 * area's order list. cKeyExpr is stored as the textual expression. lUnique
 * rejects duplicate keys when true. The record pointer is traversed while the
 * index is built and the area remains open afterward.
 *
 * $NOTES$
 * The current work area must be open and writable. Invalid blocks, expressions,
 * paths or duplicate keys in a unique index raise an error. DbCreateIndex()
 * creates one index directly; DbSetIndex() loads an existing order bag and
 * OrdCreate() provides equivalent order-oriented naming.
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
 * DbSetIndex(), DbClearIndex(), OrdCreate()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "index_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "index_demo.dbf", "People" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbCommit()
   DbCreateIndex( "people_name.ntx", "NAME", {|| FIELD->NAME } )
   QOut( "Key: " + OrdKey( 1 ) )
   DbCloseArea()
   FErase( "index_demo.dbf" )
   FErase( "people_name.ntx" )

RETURN
