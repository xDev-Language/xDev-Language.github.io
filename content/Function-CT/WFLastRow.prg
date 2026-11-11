/*
 * $DOC$
 * $NAME$
 * WFLastRow()
 *
 * $ONELINER$
 * Return the bottom row of the usable area of the selected window
 *
 * $SYNTAX$
 * WFLastRow( [lRelative] ) --> nRow
 *
 * $ARGUMENTS$
 * `lRelative` .T. returns the width of the margin between the border of the window and the
 * usable area instead of the screen position. The default is .F.
 *
 * $RETURNS$
 * The screen row of the bottom of the usable area, or with `lRelative` the bottom margin.
 *
 * $DESCRIPTION$
 * WFRow(), WFCol(), WFLastRow() and WFLastCol() give the usable area of the selected window, set by WFormat() and WBox(), for example to save it to a file. The margin can be passed later to WFormat() to set the same usable area again.
 *
 * $NOTES$
 * In window 0, the screen, the function gives the area set by WBoard().
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
 * WFRow(), WFCol(), WFLastRow(), WFLastCol(), WFormat(), WBox()
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
   LOCAL nValue, nMargin

   Scroll()
   SetPos( 0, 0 )

   WOpen( 12, 10, 20, 70 )
   WBox()
   DispOutAt( 0, 0, "The usable area starts here" )
   nValue  := WFLastRow()
   nMargin := WFLastRow( .T. )

   WSelect( 0 )
   Check( 'WOpen( 12, 10, 20, 70 ), WBox(), WFLastRow()   ', nValue, 19 )
   Check( 'WFLastRow( .T. )                               ', nMargin, 1 )
   Check( 'WFLastRow() in window 0                        ', WFLastRow(), nScreenRows - 1 )
   Check( 'WFLastRow( .T. ) in window 0                   ', WFLastRow( .T. ), 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
