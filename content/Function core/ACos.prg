/*
 * $DOC$
 * $NAME$
 * ACos()
 *
 * $ONELINER$
 * Calculate the arc cosine in radians
 *
 * $SYNTAX$
 * ACos( nValue ) --> nRadians
 *
 * $ARGUMENTS$
 * nValue
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

   Check( 'ACos( 1 )                       ', ACos( 1 ), 0 )
   Check( 'Round( ACos( 0.7 ), 6 )         ', Round( ACos( 0.7 ), 6 ), 0.795399 )
   Check( 'Round( RToD( ACos( 0.5 ) ), 6 ) ', Round( RToD( ACos( 0.5 ) ), 6 ), 60 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
