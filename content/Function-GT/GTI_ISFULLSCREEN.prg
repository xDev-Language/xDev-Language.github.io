/*
 * $DOC$
 * $NAME$
 * GTI_ISFULLSCREEN
 *
 * $ONELINER$
 * Query or change the full screen mode
 *
 * $SYNTAX$
 * GtInfo( GTI_ISFULLSCREEN, [lFull] ) --> lFull
 *
 * $ARGUMENTS$
 * `GTI_ISFULLSCREEN` The selector, from gtinfo.ch.
 * `lFull` .T. shows the program on the whole display, .F. in a window.
 *
 * $RETURNS$
 * The mode before the call.
 *
 * $DESCRIPTION$
 * In full screen the window has no frame and covers the whole monitor.
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
 * GTI_FULLSCREEN, GTI_ALTENTER, GTI_MAXIMIZED
 *
 * $DOCEND$
 */
