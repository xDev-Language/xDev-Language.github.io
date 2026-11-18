/*
 * $DOC$
 * $NAME$
 * SayDown()
 *
 * $ONELINER$
 * Write a string downwards, one character after another
 *
 * $SYNTAX$
 * SayDown( cString, [nDelay], [nRow], [nCol] ) --> cNull
 *
 * $ARGUMENTS$
 * `cString` The text to write, in UTF-8.
 *
 * `nDelay` The pause after each character in milliseconds. The default is 4.
 *
 * `nRow`, `nCol` Where the text starts. The default is the cursor position.
 *
 * $RETURNS$
 * Always "".
 *
 * $DESCRIPTION$
 * SayDown() writes one character in each row, downwards, in the standard color of SetColor().
 * The output ends at the last row of the screen.
 *
 * $NOTES$
 * SayDown() needs a GT. The cursor does not move. Control characters are written as they are.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SayDown() gives ""               OK
 * the color of SetColor()          OK
 * the cursor did not move          OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SayScreen(), DispOutAt()
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
   SetColor( "GR+/B" )

   /* read the cursor at once: the output of Check() moves it */
   cResult := SayDown( "xDev", 0, 5, 40 )
   lStays := Row() == 0 .AND. Col() == 0

   Check( 'SayDown() gives ""               ', cResult, "" )
   Check( 'the color of SetColor()          ', ScreenAttr( 5, 40 ), ColorToN( "GR+/B" ) )
   Check( 'the cursor did not move          ', lStays, .T. )

   /* slowly, 150 milliseconds for each character */
   SayDown( "Zażółć", 150, 5, 50 )

   SetColor( "" )
   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
