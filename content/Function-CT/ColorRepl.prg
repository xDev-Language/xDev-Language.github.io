/*
 * $DOC$
 * $NAME$
 * ColorRepl()
 *
 * $ONELINER$
 * Replace a color on the whole screen
 *
 * $SYNTAX$
 * ColorRepl( [xNewColor], [xOldColor] ) --> cNull
 *
 * $ARGUMENTS$
 * `xNewColor` The new color, a number or a color string such as "W/B". The default is the color
 * of SetClearA().
 *
 * `xOldColor` The color to replace, a number or a color string. Without it all cells of the screen
 * take the new color.
 *
 * $RETURNS$
 * Always "".
 *
 * $DESCRIPTION$
 * ColorRepl() changes only the colors; the characters stay. Use it, for example, to show the
 * fields of a finished input in another color.
 *
 * ColorWin() does the same in a part of the screen.
 *
 * $NOTES$
 * ColorRepl() needs a GT.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * ColorRepl() gives ""             OK
 * R/W cells became W/B             OK
 * other cells kept their color     OK
 * all cells take one color         OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ColorWin(), ScreenAttr(), SetClearA()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nOther

   Scroll()
   DispOutAt( 10, 0, " a field in R/W ", "R/W" )
   DispOutAt( 11, 0, " text in GR+/N  ", "GR+/N" )
   nOther := ScreenAttr( 11, 0 )

   SetPos( 0, 0 )
   Check( 'ColorRepl() gives ""             ', ColorRepl( "W/B", "R/W" ), "" )
   Check( 'R/W cells became W/B             ', ScreenAttr( 10, 0 ), ColorToN( "W/B" ) )
   Check( 'other cells kept their color     ', ScreenAttr( 11, 0 ), nOther )

   Inkey( 3 )
   ColorRepl( "N/W" )
   Check( 'all cells take one color         ', ScreenAttr( 11, 0 ), ColorToN( "N/W" ) )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
