/*
 * $DOC$
 * $NAME$
 * NToColor()
 *
 * $ONELINER$
 * Convert a numeric color attribute to a color string
 *
 * $SYNTAX$
 * NToColor( nColor, [lAsChar] ) --> cColor
 *
 * $ARGUMENTS$
 * nColor
 * lAsChar
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
 * NToColor( 7 )                        OK
 * NToColor( 116 )                      OK
 * NToColor( 31, .T. )                  OK
 * NToColor( ColorToN( "GR+/R" ), .T. ) OK
 * NToColor( 380 )                      OK
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

   Check( 'NToColor( 7 )                        ', NToColor( 7 ), "07/00" )
   Check( 'NToColor( 116 )                      ', NToColor( 116 ), "04/07" )
   Check( 'NToColor( 31, .T. )                  ', NToColor( 31, .T. ), "W+/B" )
   Check( 'NToColor( ColorToN( "GR+/R" ), .T. ) ', NToColor( ColorToN( "GR+/R" ), .T. ), "GR+/R" )
   Check( 'NToColor( 380 )                      ', NToColor( 380 ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
