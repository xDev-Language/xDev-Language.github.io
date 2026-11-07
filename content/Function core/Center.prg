/*
 * $DOC$
 * $NAME$
 * Center()
 *
 * $ONELINER$
 * Return a string for centered display
 *
 * $SYNTAX$
 * Center( cString, [nLength], [cPadChar], [lBothSides] ) --> cCenteredString
 *
 * $ARGUMENTS$
 * cString
 * nLength
 * cPadChar
 * lBothSides
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

   Check( 'Center( "xx", 10 )           ', Center( "xx", 10 ), "    xx" )
   Check( 'Center( "xx", 10, .T. )      ', Center( "xx", 10, .T. ), "    xx    " )
   Check( 'Center( "xx     ", 10, .T. ) ', Center( "xx     ", 10, .T. ), "    xx    " )
   Check( 'Center( "xx", 10, "." )      ', Center( "xx", 10, "." ), "....xx" )
   Check( 'Center( "xx", 10, ".", .T. ) ', Center( "xx", 10, ".", .T. ), "....xx...." )
   Check( 'Center( "x", 10, ".", .T. )  ', Center( "x", 10, ".", .T. ), ".....x...." )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
