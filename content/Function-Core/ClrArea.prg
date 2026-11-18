/*
 * $DOC$
 * $NAME$
 * ClrArea()
 *
 * $ONELINER$
 * Give an area of the screen one color
 *
 * $SYNTAX$
 * ClrArea( nTop, nLeft, nBottom, nRight, xColor ) --> NIL
 *
 * $ARGUMENTS$
 * `nTop`, `nLeft`, `nBottom`, `nRight` The area.
 *
 * `xColor` The color, a number or a color string such as "W+/R".
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * ClrArea() changes only the colors of the area; the characters stay. Use it, for example, to
 * show the selected line of a list.
 *
 * $NOTES$
 * ClrArea() needs a GT. ColorWin() can change only one color of an area.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * the area has the new color       OK
 * a cell outside kept its color    OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ColorWin(), ColorRepl(), ScreenAttr()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   Scroll()
   DispOutAt( 10, 0, "first line ", "W/N" )
   DispOutAt( 11, 0, "second line", "W/N" )

   ClrArea( 10, 0, 10, 9, "W+/R" )

   SetPos( 0, 0 )
   Check( 'the area has the new color       ', ScreenAttr( 10, 3 ), ColorToN( "W+/R" ) )
   Check( 'a cell outside kept its color    ', ScreenAttr( 11, 3 ), ColorToN( "W/N" ) )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
