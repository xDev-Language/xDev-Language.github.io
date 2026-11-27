/*
 * $DOC$
 * $NAME$
 * ColorIndex()
 *
 * $ONELINER$
 * Return one color value of a color string
 *
 * $SYNTAX$
 * ColorIndex( cColorString, nColorIndex ) --> cColorValue
 *
 * $ARGUMENTS$
 * `cColorString` A color string such as "W/N, BG+/B, R/W".
 *
 * `nColorIndex` The position of the value, from 0 for the first one.
 *
 * $RETURNS$
 * The color value without the spaces around it, or "" when there is no value at the position.
 *
 * $DESCRIPTION$
 * ColorIndex() counts from 0, so the constants of the color positions can be used directly, for
 * example 0 for the standard color and 1 for the enhanced color.
 *
 * $NOTES$
 * GetClrPair() returns the same value, but counts the positions from 1 and keeps the spaces.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * the standard color, position 0   OK
 * the enhanced color, position 1   OK
 * the spaces are removed           OK
 * a missing position gives ""      OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * GetClrPair(), SetClrPair(), SetColor()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cColors := "W/N, BG+/B ,R/W"

   Check( 'the standard color, position 0   ', ColorIndex( cColors, 0 ), "W/N" )
   Check( 'the enhanced color, position 1   ', ColorIndex( cColors, 1 ), "BG+/B" )
   Check( 'the spaces are removed           ', Len( ColorIndex( cColors, 1 ) ), 5 )
   Check( 'a missing position gives ""      ', ColorIndex( cColors, 3 ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
