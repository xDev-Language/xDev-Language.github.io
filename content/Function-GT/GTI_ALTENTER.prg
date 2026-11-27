/*
 * $DOC$
 * $NAME$
 * GTI_ALTENTER
 *
 * $ONELINER$
 * Query or change the Alt+Enter full screen switch
 *
 * $SYNTAX$
 * GtInfo( GTI_ALTENTER, [lOn] ) --> lOn
 *
 * $ARGUMENTS$
 * `GTI_ALTENTER` The selector, from gtinfo.ch.
 * `lOn` .T. lets Alt+Enter switch between the window and full screen.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * GTI_ISFULLSCREEN switches the full screen from the program.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
 *
 * Toggle the shortcut independently of the current full-screen state, then restore both.
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
 * GTI_ISFULLSCREEN
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

   LOCAL lSaved := GtInfo( GTI_ALTENTER )
   LOCAL lFull := GtInfo( GTI_ISFULLSCREEN )
   LOCAL lEnabled := .T.
   LOCAL nKey

   IF ValType( lSaved ) != "L" .OR. ValType( lFull ) != "L"
      OutStd( "Full-screen shortcut unavailable.", Eol() )
      RETURN
   ENDIF

   DO WHILE .T.
      GtInfo( GTI_ALTENTER, lEnabled )
      Scroll()
      DispOutAt( 1, 2, "Alt+Enter shortcut: " + IIF( lEnabled, "enabled", "disabled" ) )
      DispOutAt( 3, 2, "Try Alt+Enter. Space toggles the shortcut. Esc exits." )
      nKey := Inkey( 12, INKEY_ALLEVENTS )
      IF nKey == 0 .OR. nKey == K_ESC
         EXIT
      ELSEIF nKey == K_SPACE
         lEnabled := ! lEnabled
      ENDIF
   ENDDO

   GtInfo( GTI_ISFULLSCREEN, lFull )
   GtInfo( GTI_ALTENTER, lSaved )

RETURN
