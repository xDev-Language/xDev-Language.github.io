/*
 * $DOC$
 * $NAME$
 * GTI_DISPIMAGE
 *
 * $ONELINER$
 * Show an image in the window
 *
 * $SYNTAX$
 * GtInfo( GTI_DISPIMAGE, cFile | aPixels, [aArea | lFit] ) --> lShown
 *
 * $ARGUMENTS$
 * `GTI_DISPIMAGE` The selector, from gtinfo.ch.
 * `cFile` A BMP or PNG file. An empty string shows the text again in the area.
 * `aPixels` Raw pixels as { cData, nWidth, nHeight, [nDepth] }, with a depth of 1, 16, 24 or 32
 * bits.
 * `aArea` { nLeft, nTop } for the natural size, or { nLeft, nTop, nRight, nBottom } to stretch
 * the image to the rectangle.
 * `lFit` .T. fits the image to the window and centers it.
 *
 * $RETURNS$
 * .T. when the image was shown.
 *
 * $DESCRIPTION$
 * Without the area the image covers the whole window. The image lies over the text and stays
 * until the cells below it are painted again.
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
 * GfxPrimitive(), GTI_EXPOSEAREA
 *
 * $DOCEND$
 */
