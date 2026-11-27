/*
 * $DOC$
 * $NAME$
 * ClearSlow()
 *
 * $ONELINER$
 * Clear a screen area step by step, from the border to the middle
 *
 * $SYNTAX$
 * ClearSlow( nDelay, [nTop], [nLeft], [nBottom], [nRight], [xChar] ) --> cNull
 *
 * $ARGUMENTS$
 * `nDelay` The pause after each step in milliseconds.
 *
 * `nTop`, `nLeft`, `nBottom`, `nRight` The area. The default is the whole screen.
 *
 * `xChar` The character that fills the area, a string or a code point. The default is the
 * character of SetClearB().
 *
 * $RETURNS$
 * Always "".
 *
 * $DESCRIPTION$
 * Each step clears one frame, the next one is one cell further in. Rows and columns reach the
 * middle in the same step, so a wide area closes like a narrow one. The cells take the color of
 * SetClearA().
 *
 * $NOTES$
 * ClearSlow() needs a GT. ClearWin() clears an area at once.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * ClearSlow() gives ""             OK
 * the area has the color of ClearA OK
 * a cell outside kept its color    OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ClearWin(), SetClearA(), SetClearB()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL cResult, nInside, nOutside, i

   Scroll()
   FOR i := 5 TO 15
      DispOutAt( i, 10, Replicate( "#", 60 ), "GR+/B" )
   NEXT

   SetClearA( "W/N" )
   cResult := ClearSlow( 30, 5, 10, 15, 59 )
   nInside := ScreenAttr( 10, 30 )
   nOutside := ScreenAttr( 10, 60 )

   SetPos( 0, 0 )
   Check( 'ClearSlow() gives ""             ', cResult, "" )
   Check( 'the area has the color of ClearA ', nInside, ColorToN( "W/N" ) )
   Check( 'a cell outside kept its color    ', nOutside, ColorToN( "GR+/B" ) )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
