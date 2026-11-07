/*
 * $DOC$
 * $NAME$
 * WClose()
 *
 * $ONELINER$
 * Close the selected window
 *
 * $SYNTAX$
 * WClose() --> nWindow
 *
 * $ARGUMENTS$
 *
 * $RETURNS$
 * The handle of the window that is selected now.
 *
 * $DESCRIPTION$
 * WClose() closes the selected window and shows again what lay under it. The open window with
 * the highest handle becomes the selected window, not the window that was selected before; save
 * a handle in a variable to select the window you need later. When the last window is closed,
 * window 0, the screen, is selected. The handle of the closed window can be used again by the
 * next WOpen().
 *
 * $NOTES$
 * Window 0, the screen, cannot be closed: WClose() changes nothing and returns 0.
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
 * WOpen(), WAClose(), WSelect()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nWindow1, nWindow3, nAfterThird, nAfterFirst

   Scroll()
   SetPos( 0, 0 )

   nWindow1 := WOpen( 12, 5, 18, 35, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   DispOutAt( 1, 1, "Window 1" )
   WOpen( 13, 40, 19, 70, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   DispOutAt( 1, 1, "Window 2" )
   nWindow3 := WOpen( 14, 20, 20, 50, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   DispOutAt( 1, 1, "Window 3" )

   WSelect( nWindow3 )
   nAfterThird := WClose()
   WSelect( nWindow1 )
   nAfterFirst := WClose()

   WSelect( 0 )
   Check( 'WClose() of window 3           ', nAfterThird, 2 )
   Check( 'WClose() of window 1           ', nAfterFirst, 2 )
   Check( 'WClose() in window 0           ', WClose(), 0 )
   Check( 'WNum()                         ', WNum(), 2 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
