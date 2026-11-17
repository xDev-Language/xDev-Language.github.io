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

#include "gtinfo.ch"

PROCEDURE Main()

   GtInfo( GTI_CLIPBOARDDATA, "xDev clipboard example" )
   QOut( "Clipboard: " + GtInfo( GTI_CLIPBOARDDATA ) )

RETURN
