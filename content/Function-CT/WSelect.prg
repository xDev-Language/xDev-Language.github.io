/*
 * $DOC$
 * $NAME$
 * WSelect()
 *
 * $ONELINER$
 * Select an open window or return the selected window
 *
 * $SYNTAX$
 * WSelect( [nWindow] ) --> nSelectedWindow
 *
 * $ARGUMENTS$
 * `nWindow` The handle of an open window, or 0 for the screen. Without the argument the
 * selected window does not change.
 *
 * $RETURNS$
 * The handle of the selected window, or -1 when `nWindow` is not an open window.
 *
 * $DESCRIPTION$
 * The selected window receives all screen output and comes to the top of the other windows.
 * Window 0, the screen, stays under all windows: output to it is visible only where no window
 * covers it. Each window keeps its own cursor position, cursor shape and colors, so selecting a
 * window brings them back.
 *
 * $NOTES$
 * With a handle that is not open, WSelect() returns -1 and the selected window does not change.
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
 * WOpen(), WClose(), WNum()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nWindow1, nWindow2, nSelected, nFirst, nWrong, nAfterWrong

   Scroll()
   SetPos( 0, 0 )

   nWindow1 := WOpen( 12, 5, 18, 45, .T. )
   SetColor( "W+/B" )
   Scroll()
   DispOutAt( 0, 0, "Window 1 is on the top" )
   nWindow2 := WOpen( 14, 25, 20, 65, .T. )
   SetColor( "W+/G" )
   Scroll()
   DispOutAt( 0, 0, "Window 2" )

   nSelected   := WSelect()
   nFirst      := WSelect( nWindow1 )
   nWrong      := WSelect( 7 )
   nAfterWrong := WSelect()

   WSelect( 0 )
   Check( 'WSelect() after two WOpen()    ', nSelected, nWindow2 )
   Check( 'WSelect( nWindow1 )            ', nFirst, 1 )
   Check( 'WSelect( 7 ), not open         ', nWrong, -1 )
   Check( 'WSelect() keeps window 1       ', nAfterWrong, 1 )
   Check( 'WSelect( 0 ), the screen       ', WSelect(), 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
