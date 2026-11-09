/*
 * $DOC$
 * $NAME$
 * SetClrPair()
 *
 * $ONELINER$
 * Replace a color value in a color string
 *
 * $SYNTAX$
 * SetClrPair( cColorString, nPos, cColor ) --> cNewColorString
 *
 * $ARGUMENTS$
 * cColorString
 * nPos
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
 * GetClrPair( cColor, 6 )           OK
 * SetClrPair( "W/N,N/W", 2, "GR+/B" ) OK
 * SetClrPair( "W/N", 3, "R/W" )       OK
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

   LOCAL cColor := "W/R,W/G,W/B,W+/R,W+/G,W+/B,W/BG,W+/BG"

   cColor := SetClrPair( cColor, 6, "BG+/R" )

   Check( 'GetClrPair( cColor, 6 )           ', GetClrPair( cColor, 6 ), "BG+/R" )
   Check( 'SetClrPair( "W/N,N/W", 2, "GR+/B" ) ', SetClrPair( "W/N,N/W", 2, "GR+/B" ), "W/N,GR+/B" )
   Check( 'SetClrPair( "W/N", 3, "R/W" )       ', SetClrPair( "W/N", 3, "R/W" ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
