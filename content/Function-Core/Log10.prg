/*
 * $DOC$
 * $NAME$
 * Log10()
 *
 * $ONELINER$
 * Calculate the base-10 logarithm
 *
 * $SYNTAX$
 * Log10( nValue ) --> nLogarithm
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
 * Log10( 100 )           OK
 * Log10( 1 )             OK
 * Log10( 0.01 )          OK
 * Round( Log10( 2 ), 6 ) OK
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

   Check( 'Log10( 100 )           ', Log10( 100 ), 2 )
   Check( 'Log10( 1 )             ', Log10( 1 ), 0 )
   Check( 'Log10( 0.01 )          ', Log10( 0.01 ), -2 )
   Check( 'Round( Log10( 2 ), 6 ) ', Round( Log10( 2 ), 6 ), 0.30103 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
