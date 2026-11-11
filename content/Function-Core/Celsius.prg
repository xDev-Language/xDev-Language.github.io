/*
 * $DOC$
 * $NAME$
 * Celsius()
 *
 * $ONELINER$
 * Convert degrees Fahrenheit to Celsius
 *
 * $SYNTAX$
 * Celsius( nFahrenheit ) --> nCelsius
 *
 * $ARGUMENTS$
 * nFahrenheit
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
 * Celsius( 212 )                OK
 * Round( Celsius( 33.8 ), 6 )   OK
 * Round( Celsius( 338.0 ), 6 )  OK
 * Round( Celsius( 3380.0 ), 6 ) OK
 * Round( Celsius( -33.8 ), 6 )  OK
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

   Check( 'Celsius( 212 )                ', Celsius( 212 ), 100 )
   Check( 'Round( Celsius( 33.8 ), 6 )   ', Round( Celsius( 33.8 ), 6 ), 1 )
   Check( 'Round( Celsius( 338.0 ), 6 )  ', Round( Celsius( 338.0 ), 6 ), 170 )
   Check( 'Round( Celsius( 3380.0 ), 6 ) ', Round( Celsius( 3380.0 ), 6 ), 1860 )
   Check( 'Round( Celsius( -33.8 ), 6 )  ', Round( Celsius( -33.8 ), 6 ), -36.555556 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
