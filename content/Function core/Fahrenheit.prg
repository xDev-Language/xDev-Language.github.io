/*
 * $DOC$
 * $NAME$
 * Fahrenheit()
 *
 * $ONELINER$
 * Convert degrees Celsius to Fahrenheit
 *
 * $SYNTAX$
 * Fahrenheit( nCelsius ) --> nFahrenheit
 *
 * $ARGUMENTS$
 * nCelsius
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

   Check( 'Fahrenheit( 12.5 )   ', Fahrenheit( 12.5 ), 54.5 )
   Check( 'Fahrenheit( 125.0 )  ', Fahrenheit( 125.0 ), 257 )
   Check( 'Fahrenheit( 1250.0 ) ', Fahrenheit( 1250.0 ), 2282 )
   Check( 'Fahrenheit( -155.0 ) ', Fahrenheit( -155.0 ), -247 )
   Check( 'Fahrenheit( 100 )    ', Fahrenheit( 100 ), 212 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
