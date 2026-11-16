/*
 * $DOC$
 * $NAME$
 * GTI_SCREENSIZE
 *
 * $ONELINER$
 * Query or change the size of the window in pixels
 *
 * $SYNTAX$
 * GtInfo( GTI_SCREENSIZE, [aSize] ) --> aSize
 *
 * $ARGUMENTS$
 * `GTI_SCREENSIZE` The selector, from gtinfo.ch.
 * `aSize` The new size as { nWidth, nHeight }.
 *
 * $RETURNS$
 * The size before the call as { nWidth, nHeight }.
 *
 * $DESCRIPTION$
 * It changes the width and the height in one step, as GTI_SCREENWIDTH and GTI_SCREENHEIGHT do
 * separately.
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
 * GTI_SCREENWIDTH, GTI_SCREENHEIGHT
 *
 * $DOCEND$
 */
