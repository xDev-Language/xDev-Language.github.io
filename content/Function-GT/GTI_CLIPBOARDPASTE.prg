/*
 * $DOC$
 * $NAME$
 * GTI_CLIPBOARDPASTE
 *
 * $ONELINER$
 * Paste the clipboard into the keyboard buffer
 *
 * $SYNTAX$
 * GtInfo( GTI_CLIPBOARDPASTE ) --> lPasted
 *
 * $ARGUMENTS$
 * `GTI_CLIPBOARDPASTE` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * .T. when the clipboard held text.
 *
 * $DESCRIPTION$
 * The characters of the clipboard are added to the keyboard buffer, so the next Inkey() calls and
 * READ receive them as typed keys.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
 *
 * Paste the clipboard into a field and accept up to 30 printable ASCII characters.
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
 * GTI_CLIPBOARDDATA, Inkey()
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

   LOCAL cField := ""
   LOCAL nKey

   DispOutAt( 1, 2, "Copy a short ASCII reference, then press P to paste it." )
   nKey := Inkey( 10, INKEY_KEYBOARD )
   IF nKey != Asc( "P" ) .AND. nKey != Asc( "p" )
      RETURN
   ENDIF

   IF GtInfo( GTI_CLIPBOARDPASTE ) != .T.
      DispOutAt( 3, 2, "No text was queued." )
   ELSE
      DO WHILE ( nKey := Inkey( NIL, INKEY_KEYBOARD ) ) != 0
         IF nKey >= 32 .AND. nKey <= 126 .AND. Len( cField ) < 30
            cField += Chr( nKey )
         ENDIF
      ENDDO
      DispOutAt( 3, 2, "Reference: " + cField )
   ENDIF
   Inkey( 5 )

RETURN
