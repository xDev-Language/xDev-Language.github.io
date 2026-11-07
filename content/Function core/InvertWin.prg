/*
 * $DOC$
 * $NAME$
 * InvertWin()
 *
 * $ONELINER$
 * Exchange the foreground and background color on the screen
 *
 * $SYNTAX$
 * InvertWin( [nTop], [nLeft], [nBottom], [nRight] ) --> cNull
 *
 * $ARGUMENTS$
 * nTop
 * nLeft
 * nBottom
 * nRight
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   ClearWin( 2, 40, 8, 70, "W/B", " " )
   DispOutAt( 5, 50, "xDev", "W/B" )

   InvertWin( 2, 40, 8, 70 )

   Check( 'ScreenAttr( 5, 50 ) ', ScreenAttr( 5, 50 ), ColorToN( "B/W" ) )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
