/*
 * $DOC$
 * $NAME$
 * GTI_CLOSABLE
 *
 * $ONELINER$
 * Query or change whether the close button ends the program
 *
 * $SYNTAX$
 * GtInfo( GTI_CLOSABLE, [lClosable] ) --> lClosable
 *
 * $ARGUMENTS$
 * `GTI_CLOSABLE` The selector, from gtinfo.ch.
 * `lClosable` .T. lets the close button end the program.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * With .F. the close button sends K_CLOSE to Inkey(), and the program decides what to do.
 * GTI_CLOSEMODE gives the same choice and a third one.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
 *
 * Handle the window close request in xDev and ask for confirmation before exiting.
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
 * GTI_CLOSEMODE
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

   LOCAL nSaved := GtInfo( GTI_CLOSEMODE )
   LOCAL nKey

   IF ValType( nSaved ) != "N"
      OutStd( "Close-button controls unavailable.", Eol() )
      RETURN
   ENDIF

   GtInfo( GTI_CLOSEMODE, 0 )
   GtInfo( GTI_CLOSABLE, .F. )
   DispOutAt( 1, 2, "Click the title-bar close button to request exit." )
   DispOutAt( 2, 2, "Esc exits directly. The sample also ends after a timeout." )

   DO WHILE ( nKey := Inkey( 15, INKEY_KEYBOARD + INKEY_GTEVENT ) ) != 0 .AND. nKey != K_ESC
      IF nKey == K_CLOSE
         DispOutAt( 4, 2, "Close requested. Press Y to confirm or any other key to continue." )
         nKey := Inkey( 5, INKEY_KEYBOARD )
         IF nKey == Asc( "Y" ) .OR. nKey == Asc( "y" )
            EXIT
         ENDIF
         DispOutAt( 4, 2, Space( MaxCol() - 2 ) )
      ENDIF
   ENDDO

   GtInfo( GTI_CLOSEMODE, nSaved )

RETURN
