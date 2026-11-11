/*
 * $DOC$
 * $NAME$
 * CharWin()
 *
 * $ONELINER$
 * Replace characters in a screen area
 *
 * $SYNTAX$
 * CharWin( [nTop], [nLeft], [nBottom], [nRight], [xNewChar], [xOldChar] ) --> cNull
 *
 * $ARGUMENTS$
 * nTop
 * nLeft
 * nBottom
 * nRight
 * xNewChar
 * xOldChar
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

   ClearWin( 2, 40, 8, 70, "W+/B", "." )
   DispOutAt( 5, 50, "xDev", "W+/B" )

   CharWin( 2, 40, 8, 70, "*", "." )

   Check( 'ScreenAttr( 2, 40 ) ', ScreenAttr( 2, 40 ), ColorToN( "W+/B" ) )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
