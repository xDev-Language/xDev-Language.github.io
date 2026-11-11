/*
 * $DOC$
 * $NAME$
 * ADel()
 *
 * $ONELINER$
 * Delete an array element
 *
 * $SYNTAX$
 * ADel( aTarget, nPosition, [lAutoSize] ) --> aTarget
 *
 * $ARGUMENTS$
 * aTarget
 * nPosition
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
 * aColors[ 2 ] after ADel( aColors, 2 )      OK
 * aColors[ 3 ] after ADel( aColors, 2 )      OK
 * Len( aColors )                             OK
 * Len( aDays ) after ADel( aDays, 1, .T. )   OK
 * aDays[ 1 ]                                 OK
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

   LOCAL aColors := { "red", "green", "blue" }
   LOCAL aDays   := { "Mon", "Tue", "Wed" }

   ADel( aColors, 2 )
   Check( 'aColors[ 2 ] after ADel( aColors, 2 )      ', aColors[ 2 ], "blue" )
   Check( 'aColors[ 3 ] after ADel( aColors, 2 )      ', aColors[ 3 ], NIL )
   Check( 'Len( aColors )                             ', Len( aColors ), 3 )

   ADel( aDays, 1, .T. )
   Check( 'Len( aDays ) after ADel( aDays, 1, .T. )   ', Len( aDays ), 2 )
   Check( 'aDays[ 1 ]                                 ', aDays[ 1 ], "Tue" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
