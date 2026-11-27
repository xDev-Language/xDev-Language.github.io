/*
 * $DOC$
 * $NAME$
 * #define
 *
 * $ONELINER$
 * Give a name to a value or a parameterized expression
 *
 * $SYNTAX$
 * #define name [replacement]
 * #define name(param1, param2) replacement
 *
 * $DESCRIPTION$
 * Replacement takes place on source tokens before compilation. Macro names
 * and parameters do not distinguish letter case. For a parameterized macro,
 * attach the opening parenthesis to the name in the definition. Enclose each
 * parameter and the complete arithmetic expression in parentheses to preserve
 * grouping at the call site.
 *
 * The example packs a partly filled last carton and calculates the unused capacity.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

#define CARTON_SIZE 12
#define CARTONS(units, size) Int( ( ( units ) + ( size ) - 1 ) / ( size ) )

PROCEDURE Main()

   LOCAL nOrdered := 20
   LOCAL nSamples := 5
   LOCAL nCartons := CARTONS( nOrdered + nSamples, CARTON_SIZE )

   QOut( "Cartons", nCartons )
   QOut( "Unused places", nCartons * CARTON_SIZE - ( nOrdered + nSamples ) )

   RETURN
