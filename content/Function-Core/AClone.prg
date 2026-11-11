/*
 * $DOC$
 * $NAME$
 * AClone()
 *
 * $ONELINER$
 * Duplicate a nested or multidimensional array
 *
 * $SYNTAX$
 * AClone( aSource ) --> aDuplicate
 *
 * $ARGUMENTS$
 * aSource
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * aPrices[ 1 ] after a change in aCopy      OK
 * aPrices[ 3 ][ 1 ] after a change in aCopy OK
 * aPrices[ 1 ] after a change in aSame      OK
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aPrices := { 10, 20, { 30, 40 } }
   LOCAL aCopy   := AClone( aPrices )
   LOCAL aSame   := aPrices

   aCopy[ 1 ]      := 99
   aCopy[ 3 ][ 1 ] := 99

   Check( 'aPrices[ 1 ] after a change in aCopy      ', aPrices[ 1 ], 10 )
   Check( 'aPrices[ 3 ][ 1 ] after a change in aCopy ', aPrices[ 3 ][ 1 ], 30 )

   aSame[ 1 ] := 99

   Check( 'aPrices[ 1 ] after a change in aSame      ', aPrices[ 1 ], 99 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
