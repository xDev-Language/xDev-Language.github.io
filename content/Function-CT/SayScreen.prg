/*
 * $DOC$
 * $NAME$
 * SayScreen()
 *
 * $ONELINER$
 * Write a string on the screen and keep the colors there
 *
 * $SYNTAX$
 * SayScreen( cString, [nRow], [nCol] ) --> cNull
 *
 * $ARGUMENTS$
 * `cString` The text to write, in UTF-8.
 *
 * `nRow`, `nCol` Where the text starts. The default is the cursor position.
 *
 * $RETURNS$
 * Always "".
 *
 * $DESCRIPTION$
 * SayScreen() changes only the characters: every cell keeps its color. At the end of a row the
 * text goes on in the next row, from the same column, and stops at the end of the screen.
 *
 * $NOTES$
 * SayScreen() needs a GT. The cursor does not move.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SayScreen() gives ""             OK
 * the first cell kept its color    OK
 * the last cell kept its color     OK
 * the cursor did not move          OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ScreenAttr(), DispOutAt(), SayDown()
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
   DispOutAt( 10, 0, Space( 10 ), "GR+/B" )
   DispOutAt( 10, 10, Space( 10 ), "W+/R" )
   SetPos( 0, 0 )

   /* read the cursor at once: the output of Check() moves it */
   cResult := SayScreen( "Zażółć gęślą", 10, 4 )
   lStays := Row() == 0 .AND. Col() == 0

   Check( 'SayScreen() gives ""             ', cResult, "" )
   Check( 'the first cell kept its color    ', ScreenAttr( 10, 4 ), ColorToN( "GR+/B" ) )
   Check( 'the last cell kept its color     ', ScreenAttr( 10, 15 ), ColorToN( "W+/R" ) )
   Check( 'the cursor did not move          ', lStays, .T. )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
