/*
 * $DOC$
 * $NAME$
 * ScreenMark()
 *
 * $ONELINER$
 * Find a string on the screen and change its color
 *
 * $SYNTAX$
 * ScreenMark( cSearch, xColor, lCase, [lAll], [cPre], [cPost] ) --> lFound
 *
 * $ARGUMENTS$
 * `cSearch` The text to find, in UTF-8.
 *
 * `xColor` The new color, a number or a color string such as "W+/R".
 *
 * `lCase` .T. finds the text only with the same upper and lower case letters.
 *
 * `lAll` .T. marks every occurrence. The default .F. marks only the first one.
 *
 * `cPre` The characters allowed just before the text, for example " ". Without it any character
 * may stand there.
 *
 * `cPost` The characters allowed just after the text.
 *
 * $RETURNS$
 * .T. when the text was found at least once.
 *
 * $DESCRIPTION$
 * ScreenMark() reads the screen row by row as one text, so a word may also go on in the next
 * row. Only the colors change; the characters stay.
 *
 * Use `cPre` and `cPost` to mark whole words: with " " the word "LOCK" is found alone but not as
 * a part of "BLOCK". The text may also start at the first cell or end at the last cell of the
 * screen.
 *
 * $NOTES$
 * ScreenMark() needs a GT.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * ScreenMark() finds the word      OK
 * the word LOCK is marked          OK
 * LOCK inside BLOCK is not marked  OK
 * a missing text gives .F.         OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ColorWin(), ScreenAttr()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL lFound, lMissing, nWord, nInside

   Scroll()
   DispOutAt( 10, 5, "BLOCK and LOCK", "W/N" )

   /* the search runs before any other output on the screen */
   lFound := ScreenMark( "lock", "W+/R", .F., .T., " ", " " )
   lMissing := ScreenMark( "xyz", "W+/R", .F. )
   nWord := ScreenAttr( 10, 15 )
   nInside := ScreenAttr( 10, 6 )

   SetPos( 0, 0 )
   Check( 'ScreenMark() finds the word      ', lFound, .T. )
   Check( 'the word LOCK is marked          ', nWord, ColorToN( "W+/R" ) )
   Check( 'LOCK inside BLOCK is not marked  ', nInside, ColorToN( "W/N" ) )
   Check( 'a missing text gives .F.         ', lMissing, .F. )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
