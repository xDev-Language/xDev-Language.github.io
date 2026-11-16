/*
 * $DOC$
 * $NAME$
 * GTI_FONTWIDTH
 *
 * $ONELINER$
 * Query or change the width of a text cell in pixels
 *
 * $SYNTAX$
 * GtInfo( GTI_FONTWIDTH, [nPixels] ) --> nPixels
 *
 * $ARGUMENTS$
 * `GTI_FONTWIDTH` The selector, from gtinfo.ch.
 * `nPixels` The new width of the font.
 *
 * $RETURNS$
 * The width of a cell before the call.
 *
 * $DESCRIPTION$
 * In GTWVT the new width is used when the font is loaded next, for example by GTI_FONTSIZE.
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
 * GTI_FONTSIZE, GTI_SCREENWIDTH
 *
 * $DOCEND$
 */
