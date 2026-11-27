/*
 * $DOC$
 * $NAME$
 * GTI_MAXIMIZED
 *
 * $ONELINER$
 * Query or change whether the window is maximized
 *
 * $SYNTAX$
 * GtInfo( GTI_MAXIMIZED, [lMaximized] ) --> lMaximized
 *
 * $ARGUMENTS$
 * `GTI_MAXIMIZED` The selector, from gtinfo.ch.
 * `lMaximized` .T. maximizes the window, .F. restores its size.
 *
 * $RETURNS$
 * The state before the call.
 *
 * $DESCRIPTION$
 * A maximized window fills the desktop but keeps its frame. Nothing changes while the window is
 * in full screen.
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
 * GTI_MINIMIZED, GTI_ISFULLSCREEN
 *
 * $DOCEND$
 */
