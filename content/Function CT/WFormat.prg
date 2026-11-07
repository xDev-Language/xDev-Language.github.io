/*
 * $DOC$
 * $NAME$
 * WFormat()
 *
 * $ONELINER$
 * Change the usable area of the selected window
 *
 * $SYNTAX$
 * WFormat( [nTop], [nLeft], [nBottom], [nRight] ) --> nWindow
 *
 * $ARGUMENTS$
 * `nTop`, `nLeft`, `nBottom`, `nRight` How many rows and columns each side of the usable area
 * moves inwards. Negative values move it outwards, at most to the border of the window.
 * Without arguments all margins are removed and the whole window is usable again.
 *
 * $RETURNS$
 * The handle of the selected window, or -1 when no cell would remain usable.
 *
 * $DESCRIPTION$
 * Output to the window goes only to its usable area: row 0, column 0 is the top left cell of
 * this area, and MaxRow() and MaxCol() give its size. The margins keep their contents, so a
 * frame drawn before WFormat() stays visible. The change adds to the margins already set, also
 * by WBox().
 *
 * $NOTES$
 * In window 0, the screen, WFormat() changes nothing and returns 0.
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
 * WBox(), WFRow(), WFCol(), WFLastRow(), WFLastCol()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nResult, nMaxRow, nMaxCol, nTooLarge, nReset, nMaxRowAll

   Scroll()
   SetPos( 0, 0 )

   WOpen( 12, 10, 20, 50, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   nResult := WFormat( 1, 2, 1, 2 )
   nMaxRow := MaxRow()
   nMaxCol := MaxCol()
   nTooLarge := WFormat( 9, 0, 9, 0 )
   nReset := WFormat()
   nMaxRowAll := MaxRow()
   WFormat( 1, 2, 1, 2 )
   DispOutAt( 0, 0, "Two columns from the frame" )

   WSelect( 0 )
   Check( 'WFormat( 1, 2, 1, 2 )          ', nResult, 1 )
   Check( 'MaxRow() after WFormat()       ', nMaxRow, 6 )
   Check( 'MaxCol() after WFormat()       ', nMaxCol, 36 )
   Check( 'WFormat( 9, 0, 9, 0 )          ', nTooLarge, -1 )
   Check( 'WFormat()                      ', nReset, 1 )
   Check( 'MaxRow() without margins       ', nMaxRowAll, 8 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
