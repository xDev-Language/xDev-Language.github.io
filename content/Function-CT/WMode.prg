/*
 * $DOC$
 * $NAME$
 * WMode()
 *
 * $ONELINER$
 * Allow or forbid moving windows over the borders of the screen
 *
 * $SYNTAX$
 * WMode( [lTop], [lLeft], [lBottom], [lRight] ) --> nError
 *
 * $ARGUMENTS$
 * `lTop`, `lLeft`, `lBottom`, `lRight` .T. allows moving windows over this border of the area
 * set by WBoard(), .F. forbids it. A missing argument keeps the setting of its border.
 *
 * $RETURNS$
 * Always 0.
 *
 * $DESCRIPTION$
 * The setting is valid for all windows and for every later WMove(). At the start all four
 * borders are forbidden, so WMove() keeps windows completely visible. With a border allowed, a
 * window can move partly or completely over it.
 *
 * $NOTES$
 * WMode() can be called while windows are open; it does not move them.
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
 * WMove(), WBoard(), WCenter()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nResult, nRowOver, nColOver, nRowInside, nColInside, nColLeft

   Scroll()
   SetPos( 0, 0 )

   WOpen( 12, 10, 16, 40, .T. )
   WBox()
   DispOutAt( 1, 1, "Half over the left border" )

   nResult := WMode( .T., .T., .T., .T. )
   WMove( -2, -5 )
   nRowOver := WRow()
   nColOver := WCol()
   WMode( .F., .F., .F., .F. )
   WMove( -2, -5 )
   nRowInside := WRow()
   nColInside := WCol()
   WMode( , .T. )
   WMove( 14, -15 )
   nColLeft := WCol()

   WSelect( 0 )
   Check( 'WMode( .T., .T., .T., .T. )    ', nResult, 0 )
   Check( 'WMove( -2, -5 ), WRow()        ', nRowOver, -2 )
   Check( 'WMove( -2, -5 ), WCol()        ', nColOver, -5 )
   Check( 'WMode( .F., ... ), WRow()      ', nRowInside, 0 )
   Check( 'WMode( .F., ... ), WCol()      ', nColInside, 0 )
   Check( 'WMode( , .T. ), WCol()         ', nColLeft, -15 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
