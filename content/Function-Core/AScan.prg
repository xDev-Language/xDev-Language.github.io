/*
 * $DOC$
 * $NAME$
 * AScan()
 *
 * $ONELINER$
 * Scan an array for a value or until a block returns true ( .T. )
 *
 * $SYNTAX$
 * AScan( aTarget, expSearch, [nStart], [nCount], [lExact] ) --> nStoppedAt
 *
 * $ARGUMENTS$
 * aTarget
 * expSearch
 * nStart
 * nCount
 * lExact
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
 * AScan( aNames, "Ewa" )                     OK
 * AScan( aNames, "An" )                      OK
 * AScan( aNames, "An", , , .T. )             OK
 * AScan( aPrices, {| n | n > 10 } )          OK
 * AScan( aNames, "Anna", 2 )                 OK
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

   LOCAL aNames  := { "Anna", "Andrzej", "Ewa" }
   LOCAL aPrices := { 4.50, 12.40, 3.20 }

   Check( 'AScan( aNames, "Ewa" )                     ', AScan( aNames, "Ewa" ), 3 )
   Check( 'AScan( aNames, "An" )                      ', AScan( aNames, "An" ), 1 )
   Check( 'AScan( aNames, "An", , , .T. )             ', AScan( aNames, "An", , , .T. ), 0 )
   Check( 'AScan( aPrices, {| n | n > 10 } )          ', AScan( aPrices, {| n | n > 10 } ), 2 )
   Check( 'AScan( aNames, "Anna", 2 )                 ', AScan( aNames, "Anna", 2 ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
