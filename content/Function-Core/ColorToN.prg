/*
 * $DOC$
 * $NAME$
 * ColorToN()
 *
 * $ONELINER$
 * Convert a color string to a numeric color attribute
 *
 * $SYNTAX$
 * ColorToN( cColor ) --> nColorAttribute
 *
 * $ARGUMENTS$
 * cColor
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
 * ColorToN( "W/N" )  OK
 * ColorToN( "W+/B" ) OK
 * ColorToN( "N/W" )  OK
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

   Check( 'ColorToN( "W/N" )  ', ColorToN( "W/N" ), 7 )
   Check( 'ColorToN( "W+/B" ) ', ColorToN( "W+/B" ), 31 )
   Check( 'ColorToN( "N/W" )  ', ColorToN( "N/W" ), 112 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
