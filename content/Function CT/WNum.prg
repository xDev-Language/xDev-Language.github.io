/*
 * $DOC$
 * $NAME$
 * WNum()
 *
 * $ONELINER$
 * Return the highest handle of the open windows
 *
 * $SYNTAX$
 * WNum() --> nHighestWindow
 *
 * $ARGUMENTS$
 *
 * $RETURNS$
 * The highest handle of the open windows, 0 when no window is open.
 *
 * $DESCRIPTION$
 * WNum() helps to go through all windows in a loop. Handles between 1 and WNum() can belong to
 * windows that are already closed; WSelect() returns -1 for them.
 *
 * $NOTES$
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
 * WSelect(), WOpen()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nWindow2, nHighest, nOpen := 0, i

   Scroll()
   SetPos( 0, 0 )

   WOpen( 12, 3, 19, 12, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   nWindow2 := WOpen( 12, 20, 20, 70, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   WOpen( 14, 5, 21, 60, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   WSelect( nWindow2 )
   WClose()

   nHighest := WNum()
   FOR i := 1 TO nHighest
      IF WSelect( i ) == i
         nOpen++
      ENDIF
   NEXT

   WSelect( 0 )
   Check( 'WNum()                         ', nHighest, 3 )
   Check( 'open windows from 1 to WNum()  ', nOpen, 2 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
