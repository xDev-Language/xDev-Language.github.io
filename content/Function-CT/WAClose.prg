/*
 * $DOC$
 * $NAME$
 * WAClose()
 *
 * $ONELINER$
 * Close all windows
 *
 * $SYNTAX$
 * WAClose() --> nError
 *
 * $ARGUMENTS$
 *
 * $RETURNS$
 * 0 when windows were closed, -1 when no window was open.
 *
 * $DESCRIPTION$
 * WAClose() closes all windows opened with WOpen(). The screen shows again what lay under the
 * windows and window 0, the screen, becomes the selected window.
 *
 * $NOTES$
 * WAClose() does not change the area set by WBoard().
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
 * WClose(), WOpen()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nResult

   Scroll()
   SetPos( 0, 0 )

   DispOutAt( 14, 10, "This text comes back after WAClose()" )
   WOpen( 12, 5, 18, 40, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   WOpen( 13, 30, 20, 70, .T. )
   DispBox( 0, 0, MaxRow(), MaxCol() )
   Inkey( 1 )

   nResult := WAClose()

   Check( 'WAClose()                      ', nResult, 0 )
   Check( 'WSelect() after WAClose()      ', WSelect(), 0 )
   Check( 'WNum() after WAClose()         ', WNum(), 0 )
   Check( 'WAClose() without windows      ', WAClose(), -1 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
