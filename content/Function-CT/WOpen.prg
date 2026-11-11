/*
 * $DOC$
 * $NAME$
 * WOpen()
 *
 * $ONELINER$
 * Open a new window and select it
 *
 * $SYNTAX$
 * WOpen( nTop, nLeft, nBottom, nRight, [lClear] ) --> nWindow
 *
 * $ARGUMENTS$
 * `nTop`, `nLeft`, `nBottom`, `nRight` Screen coordinates of the window. The window may lie
 * partly or completely outside the screen.
 * `lClear` .T. clears the window with the current color and the SetClearB() character. The
 * default .F. keeps the screen contents under the window.
 *
 * $RETURNS$
 * The handle of the new window, from 1 to 255, or -1 when the window cannot be opened.
 *
 * $DESCRIPTION$
 * The new window becomes the selected window and lies on top of all other windows. All screen
 * output goes to the selected window: coordinates are relative to its top left corner, output is
 * clipped to the window, and MaxRow() and MaxCol() give its size. The window takes the color and
 * the cursor shape of the window it was opened from. The screen under the window is kept and
 * comes back when the window is closed or moved. The lowest free handle is used. Window 0 is the
 * screen itself.
 *
 * $NOTES$
 * With a shadow set by WSetShadow(), the window is always cleared.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Function CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * WClose(), WSelect(), WBox(), WSetShadow()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nWindow1, nWindow2, nMaxRow, nMaxCol

   Scroll()
   SetPos( 0, 0 )

   nWindow1 := WOpen( 12, 10, 18, 50, .T. )
   SetColor( "W+/B" )
   Scroll()
   DispOutAt( 0, 0, "Window 1, row 0, column 0" )
   nMaxRow := MaxRow()
   nMaxCol := MaxCol()

   nWindow2 := WOpen( 15, 30, 21, 70 )
   DispOutAt( 1, 1, "Window 2 shows the screen under it" )

   WSelect( 0 )
   Check( 'WOpen( 12, 10, 18, 50, .T. )   ', nWindow1, 1 )
   Check( 'MaxRow() in window 1           ', nMaxRow, 6 )
   Check( 'MaxCol() in window 1           ', nMaxCol, 40 )
   Check( 'WOpen( 15, 30, 21, 70 )        ', nWindow2, 2 )
   Check( 'WOpen( 12, 10, 11, 50 )        ', WOpen( 12, 10, 11, 50 ), -1 )
   Check( 'WSelect() after the error      ', WSelect(), 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
