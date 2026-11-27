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
 * Keep the window title in sync with the active view and its modified state.
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

   LOCAL cSaved := GtInfo( GTI_WINTITLE )
   LOCAL aDocuments := { "Orders", "Stock", "Invoices" }
   LOCAL nActive := 1
   LOCAL lModified := .F.
   LOCAL cTitle, nKey

   IF ValType( cSaved ) != "C"
      OutStd( "Window title unavailable.", Eol() )
      RETURN
   ENDIF

   DO WHILE .T.
      cTitle := aDocuments[ nActive ] + IIF( lModified, " *", "" ) + " - xDev"
      GtInfo( GTI_WINTITLE, cTitle )
      Scroll()
      DispOutAt( 1, 2, "Active view: " + aDocuments[ nActive ] )
      DispOutAt( 2, 2, "Title: " + GtInfo( GTI_WINTITLE ) )
      DispOutAt( 4, 2, "Tab changes view. Space toggles the modified marker." )
      DispOutAt( 5, 2, "Esc exits." )
      nKey := Inkey( 10, INKEY_KEYBOARD )
      DO CASE
      CASE nKey == 0 .OR. nKey == K_ESC
         EXIT
      CASE nKey == K_TAB
         nActive := nActive % Len( aDocuments ) + 1
         lModified := .F.
      CASE nKey == K_SPACE
         lModified := ! lModified
      ENDCASE
   ENDDO

   GtInfo( GTI_WINTITLE, cSaved )

RETURN
