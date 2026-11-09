/*
 * $DOC$
 * $NAME$
 * Tan()
 *
 * $ONELINER$
 * Calculate the tangent of an angle in radians
 *
 * $SYNTAX$
 * Tan( nRadians ) --> nTangent
 *
 * $ARGUMENTS$
 * nRadians
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
 * Tan( 0 )                    OK
 * Round( Tan( Pi() / 4 ), 6 ) OK
 * Round( Tan( Pi() / 9 ), 6 ) OK
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

   Check( 'Tan( 0 )                    ', Tan( 0 ), 0 )
   Check( 'Round( Tan( Pi() / 4 ), 6 ) ', Round( Tan( Pi() / 4 ), 6 ), 1 )
   Check( 'Round( Tan( Pi() / 9 ), 6 ) ', Round( Tan( Pi() / 9 ), 6 ), 0.36397 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
