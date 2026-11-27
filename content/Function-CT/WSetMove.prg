/*
 * $DOC$
 * $NAME$
 * WSetMove()
 *
 * $ONELINER$
 * Allow or forbid moving windows interactively
 *
 * $SYNTAX$
 * WSetMove( [lMove] ) --> lPreviousMove
 *
 * $ARGUMENTS$
 * `lMove` .T. allows the user to move the selected window, .F. forbids it. Without the argument
 * the setting does not change.
 *
 * $RETURNS$
 * The previous setting. At the start it is .T.
 *
 * $DESCRIPTION$
 * While Scroll Lock is on, the cursor keys move the selected window instead of reaching the
 * program. One key moves the window by the step of WStep(), 2 rows or 5 columns by default. Two
 * opposite keys one after the other move it by 1 on that axis. The window stays inside the area
 * of WBoard() as WMode() allows.
 *
 * With Scroll Lock off, or with WSetMove( .F. ), the cursor keys reach the program as usual.
 * Window 0, the screen, is never moved.
 *
 * WSetMove() does not change WMove(), which always moves the window.
 *
 * $NOTES$
 * The keys are taken while the program waits for a key, for example in Inkey(). Keys put into
 * the buffer by the program, for example with KEYBOARD, never move a window.
 *
 * KSetScroll() reads and, on Windows, changes the state of Scroll Lock.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * WSetMove()                     OK
 * WSetMove( .F. )                OK
 * WSetMove() after .F.           OK
 * WSetMove( .T. )                OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * WStep(), WMove(), WMode(), WBoard(), KSetScroll()
 *
 * $DOCEND$
 */

#include "inkey.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL lScroll

   Scroll()
   SetPos( 0, 0 )

   Check( 'WSetMove()                     ', WSetMove(), .T. )
   Check( 'WSetMove( .F. )                ', WSetMove( .F. ), .T. )
   Check( 'WSetMove() after .F.           ', WSetMove(), .F. )
   Check( 'WSetMove( .T. )                ', WSetMove( .T. ), .F. )

   /* Scroll Lock on, so the cursor keys move the window */
   lScroll := KSetScroll( .T. )

   WOpen( 8, 10, 14, 50, .T. )
   WBox()
   DispOutAt( 0, 1, "Scroll Lock on: the cursor keys move" )
   DispOutAt( 1, 1, "this window. Left, Right moves by 1." )
   DispOutAt( 3, 1, "Esc ends the program." )

   DO WHILE Inkey( 0 ) != K_ESC
   ENDDO

   WClose()
   KSetScroll( lScroll )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
