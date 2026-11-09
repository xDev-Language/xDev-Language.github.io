/*
 * $DOC$
 * $NAME$
 * NToC()
 *
 * $ONELINER$
 * Convert an integer to a string of digits for a specified number base
 *
 * $SYNTAX$
 * NToC( nInteger, [nBase], [nLength], [cPad] ) --> cString
 *
 * $ARGUMENTS$
 * nInteger
 * nBase
 * nLength
 * cPad
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
 * NToC( 60000 )         OK
 * NToC( 60000, 10, 7 )  OK
 * NToC( 60000, 2 )      OK
 * NToC( 48, 2, 8, "0" ) OK
 * NToC( 43981, 16 )     OK
 * NToC( 43981, 36, 4 )  OK
 * NToC( -1, 16 )        OK
 * NToC( 60000, 10, 3 )  OK
 * NToC( 60000, 1, 4 )   OK
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

   Check( 'NToC( 60000 )         ', NToC( 60000 ), "60000" )
   Check( 'NToC( 60000, 10, 7 )  ', NToC( 60000, 10, 7 ), "  60000" )
   Check( 'NToC( 60000, 2 )      ', NToC( 60000, 2 ), "1110101001100000" )
   Check( 'NToC( 48, 2, 8, "0" ) ', NToC( 48, 2, 8, "0" ), "00110000" )
   Check( 'NToC( 43981, 16 )     ', NToC( 43981, 16 ), "ABCD" )
   Check( 'NToC( 43981, 36, 4 )  ', NToC( 43981, 36, 4 ), " XXP" )
   Check( 'NToC( -1, 16 )        ', NToC( -1, 16 ), "FFFFFFFFFFFFFFFF" )
   Check( 'NToC( 60000, 10, 3 )  ', NToC( 60000, 10, 3 ), "***" )
   Check( 'NToC( 60000, 1, 4 )   ', NToC( 60000, 1, 4 ), "****" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
