/*
 * $DOC$
 * $NAME$
 * ClEol()
 *
 * $ONELINER$
 * Clear the characters and colors in a row on the screen
 *
 * $SYNTAX$
 * ClEol( [nRow], [nCol] ) --> cNull
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

   SetClearA( "W+/G" )
   ClEol( 3, 40 )

   Check( 'ScreenAttr( 3, MaxCol() ) ', ScreenAttr( 3, MaxCol() ), ColorToN( "W+/G" ) )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
