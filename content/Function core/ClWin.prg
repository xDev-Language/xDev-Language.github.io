/*
 * $DOC$
 * $NAME$
 * ClWin()
 *
 * $ONELINER$
 * Clear the characters and colors in a screen area
 *
 * $SYNTAX$
 * ClWin( [nTop], [nLeft], [nBottom], [nRight] ) --> cNull
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

   SetClearA( "N/W" )
   SetClearB( "." )
   ClWin( 2, 40, 8, 70 )

   Check( 'ScreenAttr( 5, 50 ) ', ScreenAttr( 5, 50 ), ColorToN( "N/W" ) )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
