/*
 * $DOC$
 * $NAME$
 * CToN()
 *
 * $ONELINER$
 * Convert a string of digits to an integer of the specified base
 *
 * $SYNTAX$
 * CToN( cDigits, [nBase], [lNegative] ) --> nInteger
 *
 * $ARGUMENTS$
 * cDigits
 * nBase
 * lNegative
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

   Check( 'CToN( "60000" )                     ', CToN( "60000" ), 60000 )
   Check( 'CToN( "11", 2 )                     ', CToN( "11", 2 ), 3 )
   Check( 'CToN( "1110101001100000", 2 )       ', CToN( "1110101001100000", 2 ), 60000 )
   Check( 'CToN( "ABCD", 16 )                  ', CToN( "ABCD", 16 ), 43981 )
   Check( 'CToN( "XXP", 36 )                   ', CToN( "XXP", 36 ), 43981 )
   Check( 'CToN( "  ff  ", 16 )                ', CToN( "  ff  ", 16 ), 255 )
   Check( 'CToN( "FFFFFFFFFFFFFFFF", 16, .T. ) ', CToN( "FFFFFFFFFFFFFFFF", 16, .T. ), -1 )
   Check( 'CToN( "12G", 16 )                   ', CToN( "12G", 16 ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
