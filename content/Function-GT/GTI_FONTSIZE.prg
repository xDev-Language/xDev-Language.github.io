/*
 * $DOC$
 * $NAME$
 * GTI_FONTSIZE
 *
 * $ONELINER$
 * Query or change the height of a text cell in pixels
 *
 * $SYNTAX$
 * GtInfo( GTI_FONTSIZE, [nPixels] ) --> nPixels
 *
 * $ARGUMENTS$
 * `GTI_FONTSIZE` The selector, from gtinfo.ch.
 * `nPixels` The new height of the font.
 *
 * $RETURNS$
 * The height of a cell before the call.
 *
 * $DESCRIPTION$
 * A new height loads the font in this size and changes the size of the window. The width of the
 * cell follows the font, see GTI_FONTWIDTH.
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
 * GTI_FONTWIDTH, GTI_FONTNAME, GTI_FONTWEIGHT
 *
 * $DOCEND$
 */
