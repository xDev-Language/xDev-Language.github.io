/*
 * $DOC$
 * $NAME$
 * CToBit()
 *
 * $ONELINER$
 * Convert a character string to an integer based on a bit pattern
 *
 * $SYNTAX$
 * CToBit( cString, cBitPattern ) --> nInteger
 *
 * $ARGUMENTS$
 * cString
 * cBitPattern
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
 * CToBit( "H", "ADVSHR" )                      OK
 * CToBit( "RA", "ADVSHR" )                     OK
 * CToBit( "XRYA", "ADVSHR" )                   OK
 * BitToC( CToBit( "RA", "ADVSHR" ), "ADVSHR" ) OK
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

   Check( 'CToBit( "H", "ADVSHR" )                      ', CToBit( "H", "ADVSHR" ), 2 )
   Check( 'CToBit( "RA", "ADVSHR" )                     ', CToBit( "RA", "ADVSHR" ), 33 )
   Check( 'CToBit( "XRYA", "ADVSHR" )                   ', CToBit( "XRYA", "ADVSHR" ), 33 )
   Check( 'BitToC( CToBit( "RA", "ADVSHR" ), "ADVSHR" ) ', BitToC( CToBit( "RA", "ADVSHR" ), "ADVSHR" ), "AR" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
