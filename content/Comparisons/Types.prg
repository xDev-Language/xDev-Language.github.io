/*
 * $DOC$
 * $NAME$
 * Types
 *
 * $ONELINER$
 * How xDev types values: xBase without AS, C with AS
 *
 * $DESCRIPTION$
 * A variable without AS has the type ANY, as in xBase: it holds any value
 * and its type can change. A variable with AS has a fixed type and works as
 * in C. An expression whose type is known at compile time works as in C too.
 *
 * | xDev | C |
 * |---|---|
 * | `INT8` `INT16` `INT32` `INT64` | `int8_t` `int16_t` `int32_t` `int64_t` |
 * | `UINT8` `UINT16` `UINT32` `UINT64` | `uint8_t` `uint16_t` `uint32_t` `uint64_t` |
 * | `FLOAT32` | `float` |
 * | `FLOAT64` | `double` |
 * | `PTR` | `void *` |
 * | `PSZ` | `char *` in UTF-8 with a zero at the end |
 * | `STRUCT` | `struct` |
 * | field `name[ N ] AS CHAR` | `char name[ N ]`: text in UTF-8 with a zero at the end |
 *
 * A field `name AS STRING` has no C counterpart: it holds a text of any
 * length outside the structure, as `LOCAL name AS STRING`. A structure with
 * such a field, or another field of a type outside C, does not go to a DLL.
 *
 * Rules as in C:
 *
 * - Integers narrower than 32 bits are computed as `INT32`.
 * - An integer with a fraction gives the type of the fraction: `FLOAT32`
 *   with any integer gives `FLOAT32`, `FLOAT64` gives `FLOAT64`.
 * - `%` needs integers.
 * - `CAST( value AS type )` converts a value. A fraction is truncated
 *   toward zero.
 * - A number becomes `PTR` and `PTR` becomes a number only through `CAST`.
 * - The fields of C types of a `STRUCT` have the layout of a C `struct`.
 * - A minus before a number literal is a constant of the type of the
 *   literal: `-1` is `INT64`, `-1.5` is `FLOAT64`.
 *
 * Rules of xDev that differ from C:
 *
 * - `INT` is `INT64` and `FLOAT` is `FLOAT64`. An integer literal is
 *   `INT64`, above the largest `INT64` it is `UINT64`. A literal with a
 *   fraction is `FLOAT64`.
 * - `/` and `^` give a fraction, also for two integers: `7 / 2` is `3.5`.
 * - An operation only on literals and values without a type is computed at
 *   run time and gives a value without a type, as in xBase.
 * - An overflow and a value out of range, also in `CAST`, raise a runtime
 *   error.
 * - A fraction becomes an integer, and a number becomes `LOGIC` or back,
 *   only through `CAST`.
 * - A signed with an unsigned integer gives the wider signed type that holds
 *   both ranges: `INT32 + UINT32` is `INT64`. `INT64` with `UINT64` needs
 *   `CAST`.
 * - A `STRUCT` works as an `ARRAY` with named, typed fields: assignment and
 *   passing to a function share it, `SClone()` copies it.
 *
 * Types of xBase: `STRING`, `DATE`, `ARRAY`, `HASH`, `CODEBLOCK`, `OBJECT`
 * and `ANY`. Elements of `ARRAY` and `HASH` and parameters of a code block
 * have the type `ANY`. A value without a type stored in a typed variable is
 * checked at run time. `NIL` is the empty value of `PTR`, `CALLBACK`,
 * `ARRAY`, `CODEBLOCK` and `HASH`.
 *
 * $NOTES$
 * A number without a type holds an `INT64` or a `FLOAT64` value.
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
 * ARRAY CLASS HASH STRUCT, LOCAL, STRUCT, Division (/), Unary sign (+ or -)
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL xValue
   LOCAL n8   AS INT8    := 100
   LOCAL n32  AS INT32   := 7
   LOCAL nU32 AS UINT32  := 5
   LOCAL f32  AS FLOAT32 := 0.5
   LOCAL bOld := ErrorBlock( {| oError | Break( oError ) } )
   LOCAL oError

   xValue := 1
   xValue := "text"
   QOut( "Without a type:", ValType( xValue ) )
   QOut( "INT32 / 2:", n32 / 2 )
   QOut( "INT32 + UINT32:", n32 + nU32 )
   QOut( "INT32 * FLOAT32:", n32 * f32 )
   QOut( "CAST 2.7 to INT32:", CAST( 2.7 AS INT32 ) )

   BEGIN SEQUENCE
      n8 := n8 + 100
   RECOVER USING oError
      QOut( "INT8 overflow:", oError:Description )
   ENDSEQUENCE

   ErrorBlock( bOld )

RETURN
