/*
 * $DOC$
 * $NAME$
 * AIns()
 *
 * $ONELINER$
 * Insert a NIL element into an array
 *
 * $SYNTAX$
 * AIns( aTarget, nPosition, [xValue], [lAutoSize] ) --> aTarget
 *
 * $ARGUMENTS$
 * aTarget
 * nPosition
 * xValue
 * lAutoSize
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

   LOCAL aQueue := { "Anna", "Ewa", "Jan" }
   LOCAL aTeam  := { "Anna", "Jan" }

   AIns( aQueue, 2 )
   Check( 'aQueue[ 2 ] after AIns( aQueue, 2 )           ', aQueue[ 2 ], NIL )
   Check( 'aQueue[ 3 ] after AIns( aQueue, 2 )           ', aQueue[ 3 ], "Ewa" )
   Check( 'Len( aQueue )                                 ', Len( aQueue ), 3 )

   AIns( aTeam, 2, "Ewa", .T. )
   Check( 'Len( aTeam ) after AIns( aTeam, 2, "Ewa", .T. ) ', Len( aTeam ), 3 )
   Check( 'aTeam[ 2 ]                                      ', aTeam[ 2 ], "Ewa" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
