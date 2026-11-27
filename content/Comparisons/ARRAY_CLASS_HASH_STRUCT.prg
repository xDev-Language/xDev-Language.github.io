/*
 * $DOC$
 * $NAME$
 * ARRAY CLASS HASH STRUCT
 *
 * $ONELINER$
 * Compare four ways to group values
 *
 * $DESCRIPTION$
 * An array, an object, a hash and a structure all group values. They differ
 * in access, types, copying and where they may be used.
 *
 * | | ARRAY | CLASS | HASH | STRUCT |
 * |---|---|---|---|---|
 * | Access | by position: `a[ 2 ]` | by member: `o:name` | by key: `h[ "name" ]` | by field: `st.name` |
 * | Members | added and removed at run time | DATA declared in the class | added and removed at run time | fields declared in STRUCT |
 * | Value types | any, mixed | any; DATA with AS has a fixed type | any, mixed | a fixed type per field, checked by the compiler |
 * | Assignment `b := a` | b and a share one array | b and a share one object | b and a share one hash | b and a share one structure |
 * | Copy | `AClone( a )` | none | `HClone( h )` | `SClone( st )` |
 * | Where it may be used | anywhere | anywhere | anywhere | anywhere |
 * | Holds a code block | yes | yes | yes | yes, in a CODEBLOCK field |
 * | Goes to a DLL | no | no | no | yes, with @, only with fields of C types |
 *
 * Use an array for values in order. Use a hash for values found by key.
 * Use a class for data with its own methods. Use a structure for a fixed
 * set of typed values, such as the settings of a program, and for a block
 * of memory passed to a DLL.
 *
 * $NOTES$
 * A structure is an array that looks different: its fields have names and
 * types. The fields of C types have the C layout. A nested structure lies
 * inside its structure; as a whole it is not a value.
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
 * CREATE CLASS, DLL FUNCTION, LOCAL, STRUCT, SClone()
 *
 * $DOCEND$
 */

STRUCT Point
   x AS INT32
ENDSTRUCT

CREATE CLASS Counter
   DATA value INIT 1
ENDCLASS

PROCEDURE Main()

   LOCAL aFirst := { 1 }
   LOCAL aSecond
   LOCAL oFirst := Counter()
   LOCAL oSecond
   LOCAL hFirst := { "value" => 1 }
   LOCAL hSecond
   LOCAL stFirst AS Point
   LOCAL stSecond AS Point

   aSecond := aFirst
   aSecond[ 1 ] := 2
   QOut( "ARRAY ", aFirst[ 1 ] )

   oSecond := oFirst
   oSecond:value := 2
   QOut( "CLASS ", oFirst:value )

   hSecond := hFirst
   hSecond[ "value" ] := 2
   QOut( "HASH  ", hFirst[ "value" ] )

   stFirst.x := 1
   stSecond := stFirst
   stSecond.x := 2
   QOut( "STRUCT", stFirst.x )

   RETURN
