/*
 * $DOC$
 * $NAME$
 * GTI_WINTITLE
 *
 * $ONELINER$
 * Query or change the title of the window
 *
 * $SYNTAX$
 * GtInfo( GTI_WINTITLE, [cTitle] ) --> cPrevious
 *
 * $ARGUMENTS$
 * `GTI_WINTITLE` The selector, from gtinfo.ch.
 * `cTitle` The new title in UTF-8.
 *
 * $RETURNS$
 * The title before the call.
 *
 * $DESCRIPTION$
 * The title is shown in the title bar of the window and in the task bar.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
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
 * GTI_ICONFILE
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

   LOCAL cPrevious := GtInfo( GTI_WINTITLE, "xDev - GTI_WINTITLE" )
   LOCAL nCount    := 0
   LOCAL nKey

   Scroll()
   SetPos( 0, 0 )
   
   DispOutAt( 1, 2, "Title before the program: " + cPrevious )
   DispOutAt( 2, 2, "Current title:            " + GtInfo( GTI_WINTITLE ) )
   DispOutAt( 4, 2, "Any key changes the title" )
   DispOutAt( 5, 2, "Esc or 10 seconds without a key ends the program" )

   DO WHILE ( nKey := Inkey( 10 ) ) != K_ESC .AND. nKey != 0
      nCount++
      GtInfo( GTI_WINTITLE, "xDev - title number " + LTrim( Str( nCount ) ) )
      DispOutAt( 2, 2, "Current title:            " + PadR( GtInfo( GTI_WINTITLE ), 30 ) )
   ENDDO

   GtInfo( GTI_WINTITLE, cPrevious )

RETURN
