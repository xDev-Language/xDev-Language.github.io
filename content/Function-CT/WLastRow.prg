/*
 * $DOC$
 * $NAME$
 * WLastRow()
 *
 * $ONELINER$
 * Return the bottom row of the selected window
 *
 * $SYNTAX$
 * WLastRow( [lCenter] ) --> nRow
 *
 * $ARGUMENTS$
 * `lCenter` .T. returns the value the window would have after WCenter( .T. ), without moving
 * the window. The default is .F., the present position.
 *
 * $RETURNS$
 * The screen row of the bottom border of the selected window. In window 0 it is MaxRow().
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

   LOCAL nScreenRows := MaxRow() + 1
   LOCAL nNow, nMoved, nCentered

   Scroll()
   SetPos( 0, 0 )

   WOpen( 12, 10, 18, 50, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   nNow      := WLastRow()
   WMove( 14, 20 )
   nMoved    := WLastRow()
   nCentered := WLastRow( .T. )

   WSelect( 0 )
   Check( 'WOpen( 12, 10, 18, 50 ), WLastRow()   ', nNow, 18 )
   Check( 'WMove( 14, 20 ), WLastRow()           ', nMoved, 20 )
   Check( 'WLastRow( .T. )                       ', nCentered, Int( ( nScreenRows - 7 ) / 2 ) + 6 )
   Check( 'WLastRow() in window 0                ', WLastRow(), nScreenRows - 1 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
