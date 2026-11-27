/*
 * $DOC$
 * $NAME$
 * GTI_GETWIN
 *
 * $ONELINER$
 * Save the screen and the cursor
 *
 * $SYNTAX$
 * GtInfo( GTI_GETWIN ) --> aState
 *
 * $ARGUMENTS$
 * `GTI_GETWIN` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * An array of seven elements: cursor row, cursor column, cursor shape, MaxRow(), MaxCol(), the
 * screen contents, and NIL.
 *
 * $DESCRIPTION$
 * Pass the array later to GTI_SETWIN to restore the screen and the cursor.
 *
 * $NOTES$
 * Handled by the terminal layer, so it works with every GT driver.
 *
 * Show a temporary help view and verify that restoring the snapshot recovers the cursor and colors.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions GT
 *
 * $HEADER$
 * gtinfo.ch
 *
 * $SEEALSO$
 * GTI_SETWIN, SaveScreen()
 *
 * $DOCEND$
 */

#include "inkey.ch"
#include "gtinfo.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL aState, nAttr, lRestored

   DispOutAt( 1, 2, "Orders: 3 ready to ship", "W+/B" )
   SetPos( 2, 4 )
   nAttr := ScreenAttr( 1, 2 )
   aState := GtInfo( GTI_GETWIN )

   Scroll()
   DispOutAt( 1, 2, "Temporary help view. Press a key to return." )
   Inkey( 5, INKEY_KEYBOARD )

   lRestored := GtInfo( GTI_SETWIN, aState )
   IF lRestored .AND. Row() == 2 .AND. Col() == 4 .AND. ScreenAttr( 1, 2 ) == nAttr
      OutStd( "Screen attributes and cursor restored.", Eol() )
   ELSE
      OutStd( "Screen restoration check failed.", Eol() )
   ENDIF
   Inkey( 3, INKEY_KEYBOARD )

RETURN
