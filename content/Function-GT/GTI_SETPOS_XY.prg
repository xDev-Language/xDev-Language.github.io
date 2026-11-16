/*
 * $DOC$
 * $NAME$
 * GTI_SETPOS_XY
 *
 * $ONELINER$
 * Query or change the position of the window in pixels
 *
 * $SYNTAX$
 * GtInfo( GTI_SETPOS_XY, [nX, nY | aPosition] ) --> aPosition
 *
 * $ARGUMENTS$
 * `GTI_SETPOS_XY` The selector, from gtinfo.ch.
 * `nX` The new left edge of the window on the desktop.
 * `nY` The new top edge of the window on the desktop.
 * `aPosition` The new position as { nX, nY }.
 *
 * $RETURNS$
 * The position before the call as { nX, nY }.
 *
 * $DESCRIPTION$
 * The position is the top left corner of the window frame on the desktop.
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
 * GTI_SETPOS_ROWCOL, GTI_DESKTOPWIDTH
 *
 * $DOCEND$
 */
