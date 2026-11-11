/*
 * $DOC$
 * $NAME$
 * WLastCol()
 *
 * $ONELINER$
 * Return the right column of the selected window
 *
 * $SYNTAX$
 * WLastCol( [lCenter] ) --> nCol
 *
 * $ARGUMENTS$
 * `lCenter` .T. returns the value the window would have after WCenter( .T. ), without moving
 * the window. The default is .F., the present position.
 *
 * $RETURNS$
 * The screen column of the right border of the selected window. In window 0 it is MaxCol().
 *
 * $DESCRIPTION$
 * WLastRow() and WLastCol() give the bottom right corner of the selected window on the screen, without adding the window size to WRow() and WCol().
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
   nNow      := WLastCol()
   WMove( 14, 20 )
   nMoved    := WLastCol()
   nCentered := WLastCol( .T. )

   WSelect( 0 )
   Check( 'WOpen( 12, 10, 18, 50 ), WLastCol()   ', nNow, 50 )
   Check( 'WMove( 14, 20 ), WLastCol()           ', nMoved, 60 )
   Check( 'WLastCol( .T. )                       ', nCentered, Int( ( nScreenCols - 41 ) / 2 ) + 40 )
   Check( 'WLastCol() in window 0                ', WLastCol(), nScreenCols - 1 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
