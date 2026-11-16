/*
 * $DOC$
 * $NAME$
 * GTI_LOGICALWIDTH
 *
 * $ONELINER$
 * Return the width of the logical screen
 *
 * $SYNTAX$
 * GtInfo( GTI_LOGICALWIDTH ) --> nPixels
 *
 * $ARGUMENTS$
 * `GTI_LOGICALWIDTH` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The width in the pixels that the program uses, the same as GTI_SCREENWIDTH.
 *
 * $DESCRIPTION$
 * GfxPrimitive() and the other pixel values of the program count in these pixels. The driver
 * scales them to the display.
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
 * GTI_LOGICALHEIGHT, GTI_SCREENWIDTH, GTI_OUTPUTWIDTH
 *
 * $DOCEND$
 */
