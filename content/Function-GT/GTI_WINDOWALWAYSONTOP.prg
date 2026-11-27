/*
 * $DOC$
 * $NAME$
 * GTI_WINDOWALWAYSONTOP
 *
 * $ONELINER$
 * Query or change whether the window stays on top
 *
 * $SYNTAX$
 * GtInfo( GTI_WINDOWALWAYSONTOP, [lOnTop] ) --> lOnTop
 *
 * $ARGUMENTS$
 * `GTI_WINDOWALWAYSONTOP` The selector, from gtinfo.ch.
 * `lOnTop` .T. keeps the window above the windows of other programs.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * Use it for small tool windows that must stay visible.
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
 * GTI_WINDOWOPACITY, GTI_WINDOWBORDERED
 *
 * $DOCEND$
 */
