/*
 * $DOC$
 * $NAME$
 * XToC()
 *
 * $ONELINER$
 * Convert values of data type C, D, L, M, N to a string
 *
 * $SYNTAX$
 * XToC( xValue ) --> cValue
 *
 * $ARGUMENTS$
 * xValue
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
 * XToC( .T. )                OK
 * XToC( .F. )                OK
 * XToC( "123ABCabc" )        OK
 * Len( XToC( -9.9 ) )        OK
 * XToC( 9.9 ) == FToC( 9.9 ) OK
 * XToC( SToD( "19991231" ) ) OK
 * XToC( SToD( "" ) )         OK
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

   Check( 'XToC( .T. )                ', XToC( .T. ), "T" )
   Check( 'XToC( .F. )                ', XToC( .F. ), "F" )
   Check( 'XToC( "123ABCabc" )        ', XToC( "123ABCabc" ), "123ABCabc" )
   Check( 'Len( XToC( -9.9 ) )        ', Len( XToC( -9.9 ) ), 8 )
   Check( 'XToC( 9.9 ) == FToC( 9.9 ) ', XToC( 9.9 ) == FToC( 9.9 ), .T. )
   Check( 'XToC( SToD( "19991231" ) ) ', XToC( SToD( "19991231" ) ), "19991231" )
   Check( 'XToC( SToD( "" ) )         ', XToC( SToD( "" ) ), "        " )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
