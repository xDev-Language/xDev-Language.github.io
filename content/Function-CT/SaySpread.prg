/*
 * $DOC$
 * $NAME$
 * SaySpread()
 *
 * $ONELINER$
 * Write a string that spreads from its middle to both sides
 *
 * $SYNTAX$
 * SaySpread( cString, [nDelay], [nRow], [nCol] ) --> cNull
 *
 * $ARGUMENTS$
 * `cString` The text to write, in UTF-8.
 *
 * `nDelay` The pause after each step in milliseconds. The default is 4.
 *
 * `nRow` The row. The default is the cursor row.
 *
 * `nCol` The column of the middle of the text. The default is the middle of the screen.
 *
 * $RETURNS$
 * Always "".
 *
 * $DESCRIPTION$
 * The middle character, or the two middle characters, appear first. Each step adds one character
 * on each side until the whole string is shown, centered at `nCol`. The text has the standard
 * color of SetColor().
 *
 * $NOTES$
 * SaySpread() needs a GT. The cursor does not move.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SaySpread() gives ""             OK
 * the middle has SetColor()        OK
 * the cursor did not move          OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SayMoveIn(), SayDown(), SayScreen()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL cResult, lStays

   Scroll()
   SetPos( 0, 0 )
   SetColor( "W+/R" )

   /* read the cursor at once: the output of Check() moves it */
   cResult := SaySpread( "Characters", 100, 10 )
   lStays := Row() == 0 .AND. Col() == 0

   SetColor( "" )
   Check( 'SaySpread() gives ""             ', cResult, "" )
   Check( 'the middle has SetColor()        ', ScreenAttr( 10, Int( MaxCol() / 2 ) ), ColorToN( "W+/R" ) )
   Check( 'the cursor did not move          ', lStays, .T. )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
