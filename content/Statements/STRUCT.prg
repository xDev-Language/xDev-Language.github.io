/*
 * $DOC$
 * $NAME$
 * STRUCT
 *
 * $ONELINER$
 * Declare a fixed-layout record for native code
 *
 * $SYNTAX$
 * STRUCT idType
 *    idField AS type
 *    idArray[ nSize ] AS type
 * ENDSTRUCT
 *
 * $ARGUMENTS$
 * Field types: INT8, INT16, INT32, INT64, UINT8, UINT16, UINT32, UINT64,
 * INT, FLOAT32, FLOAT64, FLOAT, LOGIC, PTR or a STRUCT declared earlier.
 * nSize is a positive integer number.
 *
 * $DESCRIPTION$
 * Declare a structure at module level. Declare a variable with
 * LOCAL name AS idType and reach a field with a dot: name.idField.
 * Indices of array fields start at 1. The layout follows C on Windows x64.
 *
 * A new variable has zero fields: 0, .F. and NIL for PTR. Assignment
 * copies the whole structure. A value outside the field range or an index
 * outside the array is a runtime error.
 *
 * Pass a structure to a DLL with @name, to a parameter of the same STRUCT
 * type or of type PTR.
 *
 * $NOTES$
 * A structure is only a LOCAL variable. It cannot be STATIC, a function
 * result, a parameter, an array element, an ANY value, class DATA or a
 * value used inside a code block. Keep data with a code block in a class
 * or a hash.
 *
 * A field cannot be named AND or OR.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ARRAY CLASS HASH STRUCT, DLL FUNCTION, DLL PROCEDURE, LOCAL
 *
 * $DOCEND$
 */

STRUCT ShippingBox
   edge[3] AS INT32
   grams AS INT32
ENDSTRUCT

PROCEDURE Main()

   LOCAL box AS ShippingBox
   LOCAL nVolume

   box.edge[ 1 ] := 40
   box.edge[ 2 ] := 30
   box.edge[ 3 ] := 20
   box.grams := 1500
   nVolume := box.edge[ 1 ] * box.edge[ 2 ] * box.edge[ 3 ]
   QOut( "Volume in litres", nVolume / 1000 )
   QOut( "Density in grams per litre", box.grams / ( nVolume / 1000 ) )

   RETURN
