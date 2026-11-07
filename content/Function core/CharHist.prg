/*
 * $DOC$
 * $NAME$
 * CharHist()
 *
 * $ONELINER$
 * Create a histogram of the characters in a string
 *
 * $SYNTAX$
 * CharHist( [cString] ) --> aHistogram
 *
 * $ARGUMENTS$
 * cString
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

   LOCAL aHist := CharHist( "The excellent xDev compiler" )

   Check( 'aHist[ Asc( "e" ) + 1 ] ', aHist[ Asc( "e" ) + 1 ], 6 )
   Check( 'aHist[ Asc( "l" ) + 1 ] ', aHist[ Asc( "l" ) + 1 ], 3 )
   Check( 'aHist[ Asc( "z" ) + 1 ] ', aHist[ Asc( "z" ) + 1 ], 0 )
   Check( 'Len( CharHist() )       ', Len( CharHist() ), 256 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
