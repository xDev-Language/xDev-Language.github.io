/*
 * $DOC$
 * $NAME$
 * GTI_CLIPBOARDDATA
 *
 * $ONELINER$
 * Read or write the text of the clipboard
 *
 * $SYNTAX$
 * GtInfo( GTI_CLIPBOARDDATA, [cText] ) --> cText
 *
 * $ARGUMENTS$
 * `GTI_CLIPBOARDDATA` The selector, from gtinfo.ch.
 * `cText` The text to put into the clipboard.
 *
 * $RETURNS$
 * Without cText the text of the clipboard.
 *
 * $DESCRIPTION$
 * With cText GtInfo() puts the text into the system clipboard, where other programs can paste it.
 * The text is UTF-8.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
 *
 * Preview the first line of clipboard text without replacing it.
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
 * GTI_CLIPBOARDPASTE, GTI_SELECTCOPY
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

   LOCAL xText := GtInfo( GTI_CLIPBOARDDATA )
   LOCAL cFirstLine, nBreak

   IF ValType( xText ) != "C" .OR. Empty( xText )
      OutStd( "No clipboard text available.", Eol() )
      RETURN
   ENDIF

   cFirstLine := StrTran( xText, Chr( 13 ), "" )
   nBreak := At( Chr( 10 ), cFirstLine )
   IF nBreak > 0
      cFirstLine := Left( cFirstLine, nBreak - 1 )
   ENDIF
   cFirstLine := StrTran( cFirstLine, Chr( 9 ), " " )
   DispOutAt( 1, 2, "Clipboard preview (first line):" )
   DispOutAt( 2, 2, ULeft( cFirstLine, 50 ) )
   Inkey( 5 )

RETURN
