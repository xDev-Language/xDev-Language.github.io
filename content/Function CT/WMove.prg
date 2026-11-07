/*
 * $DOC$
 * $NAME$
 * WMove()
 *
 * $ONELINER$
 * Move the selected window
 *
 * $SYNTAX$
 * WMove( nTop, nLeft ) --> nWindow
 *
 * $ARGUMENTS$
 * `nTop`, `nLeft` The new screen position of the top left corner of the window.
 *
 * $RETURNS$
 * The handle of the selected window.
 *
 * $DESCRIPTION$
 * WMove() moves the selected window together with its contents. The screen under the old place
 * comes back. The window stays inside the area set by WBoard(): a position over a border is
 * changed to the nearest allowed one. WMode() allows moving windows over chosen borders, also
 * completely out of sight. Check the new position with WRow() and WCol().
 *
 * $NOTES$
 * In window 0, the screen, WMove() changes nothing and returns 0.
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
 * WMode(), WBoard(), WCenter(), WRow(), WCol()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nResult, nRow, nCol, nRowOver, nColOver, i

   Scroll()
   SetPos( 0, 0 )

   WOpen( 12, 10, 16, 40, .T. )
   WBox()
   DispOutAt( 1, 1, "The window moves" )
   FOR i := 1 TO 20
      WMove( 12, 10 + i )
      Inkey( 0.05 )
   NEXT

   nResult := WMove( 14, 20 )
   nRow := WRow()
   nCol := WCol()
   WMove( -3, -3 )
   nRowOver := WRow()
   nColOver := WCol()
   WMove( 14, 20 )

   WSelect( 0 )
   Check( 'WMove( 14, 20 )                ', nResult, 1 )
   Check( 'WRow() after WMove()           ', nRow, 14 )
   Check( 'WCol() after WMove()           ', nCol, 20 )
   Check( 'WMove( -3, -3 ), WRow()        ', nRowOver, 0 )
   Check( 'WMove( -3, -3 ), WCol()        ', nColOver, 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
