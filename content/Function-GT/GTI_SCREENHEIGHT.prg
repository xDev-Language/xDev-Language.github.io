/*
 * $DOC$
 * $NAME$
 * GTI_SCREENHEIGHT
 *
 * $ONELINER$
 * Query or change the height of the window in pixels
 *
 * $SYNTAX$
 * GtInfo( GTI_SCREENHEIGHT, [nPixels] ) --> nPixels
 *
 * $ARGUMENTS$
 * `GTI_SCREENHEIGHT` The selector, from gtinfo.ch.
 * `nPixels` The new height of the text area in pixels.
 *
 * $RETURNS$
 * The height before the call: the number of rows times the height of a cell.
 *
 * $DESCRIPTION$
 * A new height changes the size of the window, but not while the window is maximized or in full
 * screen. GTI_RESIZEFONT decides whether the font or the number of rows follows the new size.
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
 * GTI_SCREENWIDTH, GTI_SCREENSIZE, GTI_RESIZEFONT, GTI_FONTSIZE
 *
 * $DOCEND$
 */
