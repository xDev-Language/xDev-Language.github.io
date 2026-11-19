/*
 * $DOC$
 * $NAME$
 * Exponentiation (^ or **)
 *
 * $ONELINER$
 * Raise the base to the exponent.
 *
 * $SYNTAX$
 * left ^ right
 * left ** right
 *
 * $DESCRIPTION$
 * Raise the base to the exponent. Powers associate from right to left. Parentheses can change the grouping.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nPrincipal := 1000
   LOCAL nRate := 0.05
   LOCAL nYear

   FOR nYear := 1 TO 3
      QOut( "Year", nYear, "balance", Round( nPrincipal * ( 1 + nRate ) ^ nYear, 2 ) )
   NEXT

   // Right grouping changes the size of the search space.
   QOut( "Nested powers", 2 ** 3 ** 2, "grouped", ( 2 ** 3 ) ** 2 )

   RETURN
