/*
 * $DOC$
 * $NAME$
 * WRow()
 *
 * $ONELINER$
 * Return the top row of the selected window
 *
 * $SYNTAX$
 * WRow( [lCenter] ) --> nRow
 *
 * $ARGUMENTS$
 * `lCenter` .T. returns the value the window would have after WCenter( .T. ), without moving
 * the window. The default is .F., the present position.
 *
 * $RETURNS$
 * The screen row of the top border of the selected window. In window 0 it is 0.
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

   LOCAL nScreenRows := MaxRow() + 1
   LOCAL nNow, nMoved, nCentered

   Scroll()
   SetPos( 0, 0 )

   WOpen( 12, 10, 18, 50, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   nNow      := WRow()
   WMove( 14, 20 )
   nMoved    := WRow()
   nCentered := WRow( .T. )

   WSelect( 0 )
   Check( 'WOpen( 12, 10, 18, 50 ), WRow()   ', nNow, 12 )
   Check( 'WMove( 14, 20 ), WRow()           ', nMoved, 14 )
   Check( 'WRow( .T. )                       ', nCentered, Int( ( nScreenRows - 7 ) / 2 ) )
   Check( 'WRow() in window 0                ', WRow(), 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
