/*
 * $DOC$
 * $NAME$
 * ASin()
 *
 * $ONELINER$
 * Calculate the arc sine in radians
 *
 * $SYNTAX$
 * ASin( nValue ) --> nRadians
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

   Check( 'ASin( 0 )                     ', ASin( 0 ), 0 )
   Check( 'Round( ASin( 0.5 ), 6 )       ', Round( ASin( 0.5 ), 6 ), 0.523599 )
   Check( 'Round( RToD( ASin( 1 ) ), 6 ) ', Round( RToD( ASin( 1 ) ), 6 ), 90 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
