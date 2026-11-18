/*
 * $DOC$
 * $NAME$
 * SayMoveIn()
 *
 * $ONELINER$
 * Write a string that moves in character by character
 *
 * $SYNTAX$
 * SayMoveIn( cString, [nDelay], [nRow], [nCol], [lRight] ) --> cNull
 *
 * $ARGUMENTS$
 * `cString` The text to write, in UTF-8.
 *
 * `nDelay` The pause after each step in milliseconds. The default is 4.
 *
 * `nRow`, `nCol` Where the text ends up. The default is the cursor position.
 *
 * `lRight` .T. moves the text in from the right. The default .F. moves it in from the left.
 *
 * $RETURNS$
 * Always "".
 *
 * $DESCRIPTION$
 * From the left, the last character appears first at `nCol`, then the last two, and so on until
 * the whole string stands at `nCol`. From the right, the first character appears at the end of
 * the place and the string grows to the left. The text has the standard color of SetColor().
 *
 * $NOTES$
 * SayMoveIn() needs a GT. After the output the cursor stands after the string.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SayMoveIn() gives ""             OK
 * the cursor is after the string   OK
 * the color of SetColor()          OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SaySpread(), SayDown(), SayScreen()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL cResult, lAfter

   Scroll()
   SetColor( "GR+/B" )

   /* read the cursor at once: the output of Check() moves it */
   cResult := SayMoveIn( "xDev", 100, 10, 10 )
   lAfter := Row() == 10 .AND. Col() == 14

   SayMoveIn( "Zażółć gęślą jaźń", 60, 12, 10, .T. )

   SetPos( 0, 0 )
   Check( 'SayMoveIn() gives ""             ', cResult, "" )
   Check( 'the cursor is after the string   ', lAfter, .T. )
   Check( 'the color of SetColor()          ', ScreenAttr( 10, 10 ), ColorToN( "GR+/B" ) )

   SetColor( "" )
   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
