/*
 * $DOC$
 * $NAME$
 * WBox()
 *
 * $ONELINER$
 * Draw a frame around the selected window
 *
 * $SYNTAX$
 * WBox( [cFrame | nFrameType] ) --> nWindow
 *
 * $ARGUMENTS$
 * `cFrame` Up to nine characters: the corners and the lines clockwise from the top left
 * corner, the ninth character fills the window. A shorter string repeats its last character.
 * `nFrameType` One of 16 frame types:
 *
 * | Type | Frame | Clears the window |
 * |---|---|---|
 * | 0, 4 | double | 0 yes, 4 no |
 * | 1, 5 | single | 1 yes, 5 no |
 * | 2, 6 | double top and bottom, single sides | 2 yes, 6 no |
 * | 3, 7 | single top and bottom, double sides | 3 yes, 7 no |
 * | 8, 12 | half blocks top and bottom, full sides | 8 yes, 12 no |
 * | 9, 13 | half blocks | 9 yes, 13 no |
 * | 10, 14 | full top and bottom, half block sides | 10 yes, 14 no |
 * | 11, 15 | full blocks | 11 yes, 15 no |
 *
 * Without the argument WBox() draws a double frame and clears the window, as type 0.
 *
 * $RETURNS$
 * The handle of the selected window, or -1 when the window is too small for a frame.
 *
 * $DESCRIPTION$
 * WBox() draws the frame on the border of the usable area of the selected window with the
 * current color and then makes the usable area one row and one column smaller on each side,
 * like WFormat( 1, 1, 1, 1 ). Later output cannot overwrite the frame, and row 0, column 0 is
 * the first cell inside the frame. A second WBox() draws a frame inside the first one. The
 * window is cleared with the SetClearB() character.
 *
 * $NOTES$
 * The usable area must have at least 3 rows and 3 columns. In window 0, the screen, WBox()
 * draws the frame around the screen and does not change the usable area.
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
 * WFormat(), WOpen(), WFRow()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nDouble, nMaxRow, nSingle, nOwn, nSmall

   Scroll()
   SetPos( 0, 0 )

   WOpen( 12, 5, 18, 35 )
   nDouble := WBox()
   nMaxRow := MaxRow()
   DispOutAt( 0, 0, "Inside the double frame" )

   WOpen( 12, 40, 16, 70 )
   nSingle := WBox( 1 )
   DispOutAt( 0, 0, "Single frame" )

   WOpen( 18, 40, 22, 70 )
   nOwn := WBox( "+-+|+-+| " )
   DispOutAt( 0, 0, "Own frame characters" )

   WOpen( 20, 5, 21, 30 )
   nSmall := WBox()

   WSelect( 0 )
   Check( 'WBox()                         ', nDouble, 1 )
   Check( 'MaxRow() inside the frame      ', nMaxRow, 4 )
   Check( 'WBox( 1 )                      ', nSingle, 2 )
   Check( 'WBox( "+-+|+-+| " )            ', nOwn, 3 )
   Check( 'WBox() in a window of 2 rows   ', nSmall, -1 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
