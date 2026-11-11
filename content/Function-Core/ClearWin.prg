/*
 * $DOC$
 * $NAME$
 * ClearWin()
 *
 * $ONELINER$
 * Clear all or part of the screen
 *
 * $SYNTAX$
 * ClearWin( [nTop], [nLeft], [nBottom], [nRight], [xColor], [xChar] ) --> cNull
 *
 * $ARGUMENTS$
 * nTop
 * nLeft
 * nBottom
 * nRight
 * xColor
 * xChar
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

   Check( 'ScreenAttr( 5, 50 ) ', ScreenAttr( 5, 50 ), ColorToN( "W+/B" ) )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
