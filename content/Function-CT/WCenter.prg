/*
 * $DOC$
 * $NAME$
 * WCenter()
 *
 * $ONELINER$
 * Make the selected window completely visible or center it
 *
 * $SYNTAX$
 * WCenter( [lCenter] ) --> nWindow
 *
 * $ARGUMENTS$
 * `lCenter` .T. moves the window to the center of the area set by WBoard(). The default .F.
 * moves the window only as far as needed to make it completely visible.
 *
 * $RETURNS$
 * The handle of the selected window.
 *
 * $DESCRIPTION$
 * WCenter() brings back a window that was moved partly or completely out of sight, or centers
 * it. A window larger than the area stays at its top left corner.
 *
 * $NOTES$
 * In window 0, the screen, WCenter() changes nothing and returns 0.
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
 * WMove(), WMode(), WBoard(), WRow(), WCol()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nScreenRows := MaxRow() + 1, nScreenCols := MaxCol() + 1
   LOCAL nResult, nRowVisible, nColVisible, nRowCenter, nColCenter

   Scroll()
   SetPos( 0, 0 )

   WMode( .T., .T., .T., .T. )
   WOpen( 12, 10, 16, 40, .T. )
   WBox()
   DispOutAt( 1, 1, "Moved back by WCenter()" )
   WMove( -3, -10 )

   nResult := WCenter()
   nRowVisible := WRow()
   nColVisible := WCol()
   WCenter( .T. )
   nRowCenter := WRow()
   nColCenter := WCol()
   WMove( 14, nColCenter )
   WMode( .F., .F., .F., .F. )

   WSelect( 0 )
   Check( 'WCenter()                      ', nResult, 1 )
   Check( 'WCenter(), WRow()              ', nRowVisible, 0 )
   Check( 'WCenter(), WCol()              ', nColVisible, 0 )
   Check( 'WCenter( .T. ), WRow()         ', nRowCenter, Int( ( nScreenRows - 5 ) / 2 ) )
   Check( 'WCenter( .T. ), WCol()         ', nColCenter, Int( ( nScreenCols - 31 ) / 2 ) )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
