/*
 * $DOC$
 * $NAME$
 * GTI_SELECTCOPY
 *
 * $ONELINER$
 * Query or change copying of a mouse selection
 *
 * $SYNTAX$
 * GtInfo( GTI_SELECTCOPY, [lOn | cMenuText] ) --> lOn | cMenuText
 *
 * $ARGUMENTS$
 * `GTI_SELECTCOPY` The selector, from gtinfo.ch.
 * `lOn` .T. lets the user select text with the mouse and copy it to the clipboard.
 * `cMenuText` The text of the menu item that starts the selection. It also turns the copying on.
 *
 * $RETURNS$
 * With lOn or without an argument the setting before the call, with cMenuText the menu text
 * before the call.
 *
 * $DESCRIPTION$
 * Turning the copying off cancels a selection in progress.
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
 * GTI_CLIPBOARDDATA
 *
 * $DOCEND$
 */
