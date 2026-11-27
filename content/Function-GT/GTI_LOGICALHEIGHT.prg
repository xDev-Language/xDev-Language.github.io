/*
 * $DOC$
 * $NAME$
 * GTI_LOGICALHEIGHT
 *
 * $ONELINER$
 * Return the height of the logical screen
 *
 * $SYNTAX$
 * GtInfo( GTI_LOGICALHEIGHT ) --> nPixels
 *
 * $ARGUMENTS$
 * `GTI_LOGICALHEIGHT` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The height in the pixels that the program uses, the same as GTI_SCREENHEIGHT.
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
 * GTI_LOGICALWIDTH, GTI_SCREENHEIGHT, GTI_OUTPUTHEIGHT
 *
 * $DOCEND$
 */
