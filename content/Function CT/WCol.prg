/*
 * $DOC$
 * $NAME$
 * WCol()
 *
 * $ONELINER$
 * Return the left column of the selected window
 *
 * $SYNTAX$
 * WCol( [lCenter] ) --> nCol
 *
 * $ARGUMENTS$
 * `lCenter` .T. returns the value the window would have after WCenter( .T. ), without moving
 * the window. The default is .F., the present position.
 *
 * $RETURNS$
 * The screen column of the left border of the selected window. In window 0 it is 0.
 *
 * $DESCRIPTION$
 * WRow() and WCol() give the position of the selected window on the screen, for example to open the window again at the same place after the user moved it.
 *
 * $NOTES$
 * The value can lie outside the screen when WMode() allows moving windows over the border.
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
 * WRow(), WCol(), WLastRow(), WLastCol(), WMove(), WCenter()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nScreenCols := MaxCol() + 1
   LOCAL nNow, nMoved, nCentered

   Scroll()
   SetPos( 0, 0 )

   WOpen( 12, 10, 18, 50, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   nNow      := WCol()
   WMove( 14, 20 )
   nMoved    := WCol()
   nCentered := WCol( .T. )

   WSelect( 0 )
   Check( 'WOpen( 12, 10, 18, 50 ), WCol()   ', nNow, 10 )
   Check( 'WMove( 14, 20 ), WCol()           ', nMoved, 20 )
   Check( 'WCol( .T. )                       ', nCentered, Int( ( nScreenCols - 41 ) / 2 ) )
   Check( 'WCol() in window 0                ', WCol(), 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
