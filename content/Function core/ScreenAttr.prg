/*
 * $DOC$
 * $NAME$
 * ScreenAttr()
 *
 * $ONELINER$
 * Return the numeric color attribute for a specified coordinate on the screen
 *
 * $SYNTAX$
 * ScreenAttr( [nRow], [nCol] ) --> nAttribute
 *
 * $ARGUMENTS$
 * nRow
 * nCol
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

   DispOutAt( 2, 40, "xDev", "GR+/B" )

   Check( 'ScreenAttr( 2, 40 )                    ', ScreenAttr( 2, 40 ), ColorToN( "GR+/B" ) )
   Check( 'NToColor( ScreenAttr( 2, 40 ), .T. )   ', NToColor( ScreenAttr( 2, 40 ), .T. ), "GR+/B" )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
