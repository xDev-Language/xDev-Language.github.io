/*
 * $DOC$
 * $NAME$
 * WSetShadow()
 *
 * $ONELINER$
 * Set the shadow color of windows
 *
 * $SYNTAX$
 * WSetShadow( [cColor | nColor] ) --> nPreviousColor
 *
 * $ARGUMENTS$
 * `cColor` The shadow color as a color string, for example "N+/N".
 * `nColor` The shadow color as a number, or -1 to turn the shadow off.
 * Without the argument the setting does not change.
 *
 * $RETURNS$
 * The previous shadow color, -1 when there was no shadow.
 *
 * $DESCRIPTION$
 * The shadow lies below and to the right of every window opened later; windows already open keep
 * their shadow. The characters under the shadow stay visible in the shadow color. The right
 * shadow is two columns wide, the bottom shadow one row high. A window with a shadow is always
 * cleared when it is opened.
 *
 * $NOTES$
 * At the start no shadow is set.
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
 * WOpen(), ColorToN()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nNoShadow, nNumber, nString, i

   Scroll()
   SetPos( 0, 0 )
   FOR i := 11 TO MaxRow()
      DispOutAt( i, 0, Replicate( "xDev ", ( MaxCol() + 1 ) / 5 ) )
   NEXT

   nNoShadow := WSetShadow( 8 )
   WOpen( 12, 5, 17, 35 )
   WBox()
   DispOutAt( 0, 0, "Shadow color 8" )

   nNumber := WSetShadow( "N+/N" )
   WOpen( 14, 45, 19, 72 )
   WBox( 1 )
   DispOutAt( 0, 0, 'Shadow color "N+/N"' )

   nString := WSetShadow( -1 )

   WSelect( 0 )
   Check( 'WSetShadow( 8 )                ', nNoShadow, -1 )
   Check( 'WSetShadow( "N+/N" )           ', nNumber, 8 )
   Check( 'WSetShadow( -1 )               ', nString, 8 )
   Check( 'WSetShadow()                   ', WSetShadow(), -1 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
