/*
 * $DOC$
 * $NAME$
 * WBoard()
 *
 * $ONELINER$
 * Set the screen area for windows
 *
 * $SYNTAX$
 * WBoard( [nTop], [nLeft], [nBottom], [nRight] ) --> nError
 *
 * $ARGUMENTS$
 * `nTop`, `nLeft`, `nBottom`, `nRight` The screen area where windows are visible. Without
 * arguments the area is the whole screen again.
 *
 * $RETURNS$
 * 0 when the area is set, -1 when a window is open or the coordinates are wrong.
 *
 * $DESCRIPTION$
 * Windows are visible only inside this area, so the rest of the screen, for example a help row,
 * cannot be covered by a window, also when the window is moved. WMove(), WCenter() and WMode()
 * work with the borders of this area. Window 0, the screen, is not limited by the area.
 *
 * $NOTES$
 * WBoard() works only while no window is open. Closing windows does not change the area: set it
 * again with WBoard() without arguments when you no longer need it.
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
 * WMode(), WMove(), WCenter(), WOpen()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nResult, nWithWindow

   Scroll()
   SetPos( 0, 0 )

   DispOutAt( MaxRow(), 0, "Help row: no window covers it" )
   nResult := WBoard( 0, 0, MaxRow() - 1, MaxCol() )

   WOpen( 12, 30, MaxRow(), 70, .T. )
   WBox()
   DispOutAt( 0, 0, "The bottom row of the window" )
   DispOutAt( 1, 0, "is under the help row" )
   nWithWindow := WBoard()

   WSelect( 0 )
   Check( 'WBoard( 0, 0, MaxRow() - 1, MaxCol() )   ', nResult, 0 )
   Check( 'WBoard() with an open window              ', nWithWindow, -1 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

   WAClose()
   Check( 'WBoard( 5, 0, 2, 10 ), wrong rows         ', WBoard( 5, 0, 2, 10 ), -1 )
   Check( 'WBoard() without windows                  ', WBoard(), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
