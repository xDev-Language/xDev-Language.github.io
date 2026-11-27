/*
 * $DOC$
 * $NAME$
 * Structure field (.)
 *
 * $ONELINER$
 * Access a field of a declared structure by name.
 *
 * $SYNTAX$
 * structure.field
 *
 * $DESCRIPTION$
 * Access a field of a declared structure by name. A field can be read or assigned a value of its declared type.
 * A field of a nested structure is reached with one more dot: structure.field.other. A nested structure as a whole
 * is not a value: copy it with SClone( structure.field ).
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

STRUCT ParcelSize
   width AS INT32
   height AS INT32
   depth AS INT32
ENDSTRUCT

PROCEDURE Main()

   LOCAL parcel AS ParcelSize

   parcel.width := 30
   parcel.height := 20
   parcel.depth := 10
   QOut( "Parcel volume in litres", parcel.width * parcel.height * parcel.depth / 1000 )
   parcel.depth := 5
   QOut( "Flat parcel in litres", parcel.width * parcel.height * parcel.depth / 1000 )

   RETURN
