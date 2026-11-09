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
 * expression; it can use the operators +, -, *, /, % and ^.
 *
 * $DESCRIPTION$
 * ENUM declares a list of named integer constants. The compiler computes
 * their values, so a constant costs nothing at runtime.
 *
 * The first constant has the value 1, like the first array subscript, and
 * each next constant without := has the value of the previous one + 1. The
 * value 0 is left free to mean "no value". An ENUM constant can therefore be
 * used directly as an array subscript or as a boundary of a FOR loop.
 *
 * Use ENUM instead of numbers written in the code: a name says what the
 * number means, and a mistyped name is a compile error, while a mistyped
 * number is not.
 *
 * $NOTES$
 * ENUM is written at module level, outside any function, or in a header
 * file (.ch). The list ends with ENDENUM; END is accepted as well. A
 * constant cannot have the name of another constant or of a variable.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * RED = 1, GREEN = 2, BLUE = 3
 * CUSTOM = 10, CUSTOM_NEXT = 11
 * GREEN is called Green
 * No color selected
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

ENUM COLOR
   RED,
   GREEN,
   BLUE,
   CUSTOM := 10,
   CUSTOM_NEXT
ENDENUM

PROCEDURE Main()

   LOCAL aNames  := { "Red", "Green", "Blue" }
   LOCAL nChosen := 0

   QOut( "RED = " + s_Num( RED ) + ", GREEN = " + s_Num( GREEN ) + ", BLUE = " + s_Num( BLUE ) )
   QOut( "CUSTOM = " + s_Num( CUSTOM ) + ", CUSTOM_NEXT = " + s_Num( CUSTOM_NEXT ) )

   // the constants start at 1, so they are array subscripts
   QOut( "GREEN is called " + aNames[ GREEN ] )

   // 0 is free for "no value"
   IF nChosen == 0
      QOut( "No color selected" )
   ENDIF

   RETURN

STATIC FUNCTION s_Num( nValue )

   RETURN LTrim( Str( nValue ) )
