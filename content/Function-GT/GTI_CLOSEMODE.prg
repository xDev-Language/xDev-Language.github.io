/*
 * $DOC$
 * $NAME$
 * GTI_CLOSEMODE
 *
 * $ONELINER$
 * Query or change what the close button does
 *
 * $SYNTAX$
 * GtInfo( GTI_CLOSEMODE, [nMode] ) --> nMode
 *
 * $ARGUMENTS$
 * `GTI_CLOSEMODE` The selector, from gtinfo.ch.
 * `nMode` 0, 1 or 2.
 *
 * $RETURNS$
 * The mode before the call.
 *
 * $DESCRIPTION$
 * The modes:
 *
 * | nMode | The close button |
 * |---|---|
 * | 0 | ends the program |
 * | 1 | sends K_CLOSE to Inkey() |
 * | 2 | is disabled |
 *
 * With mode 1 the program can ask whether to save its data before it ends.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
 *
 * Compare event and disabled modes without letting the close button terminate the sample.
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
 * GTI_CLOSABLE, Inkey()
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
   LOCAL nMode := 1
   LOCAL nRequests := 0
   LOCAL nKey

   IF ValType( nSaved ) != "N"
      OutStd( "Close-button modes unavailable.", Eol() )
      RETURN
   ENDIF

   DO WHILE .T.
      GtInfo( GTI_CLOSEMODE, nMode )
      Scroll()
      DispOutAt( 1, 2, IIF( nMode == 1, "Close button sends K_CLOSE", "Close button disabled" ) )
      DispOutAt( 2, 2, "Close requests received: " + LTrim( Str( nRequests ) ) )
      DispOutAt( 4, 2, "Try the close button. Space switches modes. Esc exits." )
      nKey := Inkey( 12, INKEY_KEYBOARD + INKEY_GTEVENT )
      DO CASE
      CASE nKey == 0 .OR. nKey == K_ESC
         EXIT
      CASE nKey == K_SPACE
         nMode := 3 - nMode
      CASE nKey == K_CLOSE
         nRequests++
      ENDCASE
   ENDDO

   GtInfo( GTI_CLOSEMODE, nSaved )

RETURN
