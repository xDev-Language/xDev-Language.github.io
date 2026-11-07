/*
 * $DOC$
 * $NAME$
 * ColorWin()
 *
 * $ONELINER$
 * Replace a color attribute in a screen area
 *
 * $SYNTAX$
 * ColorWin( [nTop], [nLeft], [nBottom], [nRight], [xNewColor], [xOldColor] ) --> cNull
 *
 * $ARGUMENTS$
 * nTop
 * nLeft
 * nBottom
 * nRight
 * xNewColor
 * xOldColor
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

   ClearWin( 2, 40, 8, 70, "W+/B", " " )
   ClearWin( 4, 45, 6, 65, "W/R", " " )

   ColorWin( 2, 40, 8, 70, "N/W", "W+/B" )

   Check( 'ScreenAttr( 2, 40 ) ', ScreenAttr( 2, 40 ), ColorToN( "N/W" ) )
   Check( 'ScreenAttr( 5, 50 ) ', ScreenAttr( 5, 50 ), ColorToN( "W/R" ) )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
