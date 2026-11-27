/*
 * $DOC$
 * $NAME$
 * STRUCT
 *
 * $ONELINER$
 * Declare a record of typed fields
 *
 * $SYNTAX$
 * STRUCT idType
 *    idField AS type
 *    idText AS STRING
 *    idArray[ nSize ] AS type
 *    idChars[ nSize ] AS CHAR
 * ENDSTRUCT
 *
 * $ARGUMENTS$
 * A field takes any type after AS: INT8, INT16, INT32, INT64, UINT8, UINT16,
 * UINT32, UINT64, INT, FLOAT32, FLOAT64, FLOAT, LOGIC, PTR, PSZ, STRING, CHAR,
 * DATE, ARRAY, HASH, OBJECT, a class, CODEBLOCK, ANY or a STRUCT declared
 * earlier. nSize is a positive integer number.
 *
 * $DESCRIPTION$
 * A structure is an array that looks different: a fixed set of named fields
 * with types, checked by the compiler. Use an array for elements by
 * position and a class for fields with methods.
 *
 * Declare a structure at module level. LOCAL name AS idType or
 * STATIC name AS idType gets a new structure with zero fields: 0, .F., an
 * empty text and NIL for the other types. Reach a field with a dot:
 * name.idField. Indices of array fields start at 1. A value outside the
 * field range or an index outside the array is a runtime error.
 *
 * A structure works like an array. The variable holds a reference to it:
 * assignment and passing to a function share the structure, they do not
 * copy it. A structure goes to ANY, to arrays, hashes, code blocks,
 * functions and methods, also in other modules. ANY assigned to a structure
 * is checked at runtime; a value of another type is error 3107.
 * SClone( name ) makes a copy. ValType( name ) returns "S".
 *
 * A field of STRUCT type lies inside the structure, as in C. As a whole it
 * is not a value: use its fields, name.idField.idOther, or copy it with
 * SClone( name.idField ).
 *
 * Text fields come in two kinds:
 *
 * | Field | Holds | Use it for |
 * |---|---|---|
 * | `idText AS STRING` | a text of any length, as `LOCAL idText AS STRING` | data of the program: names, paths, settings |
 * | `idChars[ nSize ] AS CHAR` | `char idChars[ nSize ]` of C: at most nSize - 1 bytes and a zero | a structure passed to a DLL |
 *
 * A STRING field holds its text outside the structure. A copy of the
 * structure shares the text; changing the field gives the copy its own
 * text; the text is released when the structure ends.
 *
 * A CHAR field has a fixed size in the structure, as in C: the text and the
 * zero that ends it must fit. For the year "2026" write year[ 5 ] AS CHAR:
 * 4 bytes of text and 1 byte for the zero. The size counts bytes of UTF-8,
 * so "ł" takes 2. Read or assigned as a whole the field is a STRING:
 * name.year := "2026". name.year[ n ] is one byte as a number. A longer text
 * or a zero byte inside the text is a runtime error. idField AS CHAR without
 * a size is one byte. CHAR is used only in fields.
 *
 * Pass a structure to a DLL with @name, to a parameter of the same STRUCT
 * type or of type PTR. The DLL gets the fields in the C layout of Windows x64.
 * A structure with a field of STRING, DATE, ARRAY, HASH, OBJECT, CODEBLOCK or
 * ANY type, also in a nested structure, has no C layout and does not go to a
 * DLL.
 *
 * A STATIC structure, in a module or in a function, keeps its fields for
 * the whole run of the program.
 *
 * $NOTES$
 * A structure has no methods and no operators. It cannot be a DLL result or
 * class DATA. A field cannot be named AND or OR.
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
 * ARRAY CLASS HASH STRUCT, DLL FUNCTION, DLL PROCEDURE, LOCAL, SClone()
 *
 * $DOCEND$
 */

STRUCT ShippingBox
   edge[3] AS INT32
   grams AS INT32
   label AS STRING
ENDSTRUCT

PROCEDURE Main()

   LOCAL box AS ShippingBox
   LOCAL copy AS ShippingBox
   LOCAL nVolume

   box.label := "Books"
   box.edge[ 1 ] := 40
   box.edge[ 2 ] := 30
   box.edge[ 3 ] := 20
   box.grams := 1500
   nVolume := box.edge[ 1 ] * box.edge[ 2 ] * box.edge[ 3 ]
   QOut( box.label, "volume in litres", nVolume / 1000 )
   QOut( "Density in grams per litre", box.grams / ( nVolume / 1000 ) )

   copy := SClone( box )
   copy.label := "Copy"
   QOut( box.label, copy.label )

   RETURN
