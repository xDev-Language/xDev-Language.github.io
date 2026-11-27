/*
 * $DOC$
 * $NAME$
 * ENUM
 *
 * $ONELINER$
 * Declare a list of named integer constants
 *
 * $SYNTAX$
 * ENUM [idEnum]
 *    idConstant1 [:= nValue1],
 *    idConstant2 [:= nValue2],
 *    ...
 * ENDENUM
 *
 * $ARGUMENTS$
 * `idEnum` is an optional name of the list. Two lists cannot have the same
 * name.
 * `idConstant` is the name of a constant.
 * `:= nValue` gives the constant its value. `nValue` is an integer constant
 * expression; it can use the operators +, -, *, /, % and ^. Division must
 * produce a whole number.
 *
 * $DESCRIPTION$
 * ENUM declares a list of named integer constants. The compiler computes
 * their values, so a constant costs nothing at runtime.
 *
 * Without an explicit initializer, the first constant is 1 and each later
 * constant is one more than its predecessor. An explicit initializer sets
 * the value, including zero when needed. Positive enum values can serve as
 * array subscripts or FOR boundaries.
 *
 * Use ENUM instead of numbers written in the code: a name says what the
 * number means, and a mistyped name is a compile error, while a mistyped
 * number is not.
 *
 * $NOTES$
 * ENUM is written at module level, outside any function, or in a header
 * file (.ch). The list ends with ENDENUM. A constant cannot have the name of
 * another constant or of a variable.
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
 * FOR, DO CASE, #define
 *
 * $DOCEND$
 */

ENUM ManifestColumn
   SKU,
   UNITS,
   UNIT_CENTS
ENDENUM

PROCEDURE Main()

   LOCAL aManifest := { { "B17", 3, 450 }, { "A02", 2, 180 } }
   LOCAL aLine
   LOCAL nTotal := 0

   FOR EACH aLine IN aManifest
      nTotal += aLine[ UNITS ] * aLine[ UNIT_CENTS ]
      QOut( aLine[ SKU ], "line total", aLine[ UNITS ] * aLine[ UNIT_CENTS ] )
   NEXT
   QOut( "Manifest total in cents", nTotal )

   RETURN
