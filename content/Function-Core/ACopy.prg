/*
 * $DOC$
 * $NAME$
 * ACopy()
 *
 * $ONELINER$
 * Copy elements from one array to another
 *
 * $SYNTAX$
 * ACopy( aSource, aTarget, [nStart], [nCount], [nTargetPos] ) --> aTarget
 *
 * $ARGUMENTS$
 * aSource
 * aTarget
 * nStart
 * nCount
 * nTargetPos
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
 * aTarget[ 5 ] after ACopy( aSource, aTarget ) OK
 * aPart after ACopy( aSource, aPart, 2, 3, 1 ) OK
 * aTail after ACopy( aSource, aTail, NIL, NIL, 4 ) OK
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

   LOCAL aSource := { 1, 2, 3, 4, 5 }
   LOCAL aTarget := Array( 5 )
   LOCAL aPart   := { 0, 0, 0, 0, 0 }
   LOCAL aTail   := { 0, 0, 0, 0, 0 }

   ACopy( aSource, aTarget )
   Check( 'aTarget[ 5 ] after ACopy( aSource, aTarget ) ', aTarget[ 5 ], 5 )

   ACopy( aSource, aPart, 2, 3, 1 )
   Check( 'aPart after ACopy( aSource, aPart, 2, 3, 1 ) ', ;
          Str( aPart[ 1 ], 1 ) + Str( aPart[ 2 ], 1 ) + Str( aPart[ 3 ], 1 ) + Str( aPart[ 4 ], 1 ), "2340" )

   ACopy( aSource, aTail, NIL, NIL, 4 )
   Check( 'aTail after ACopy( aSource, aTail, NIL, NIL, 4 ) ', Str( aTail[ 4 ], 1 ) + Str( aTail[ 5 ], 1 ), "12" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
