/*
 * $DOC$
 * $NAME$
 * GTI_WINDOWHEIGHT
 *
 * $ONELINER$
 * Return the height of the window area
 *
 * $SYNTAX$
 * GtInfo( GTI_WINDOWHEIGHT ) --> nHeight
 *
 * $ARGUMENTS$
 * `GTI_WINDOWHEIGHT` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The height of the client area of the window in the units of the system.
 *
 * $DESCRIPTION$
 * On a scaled display the system can count in units larger than a pixel. GTI_OUTPUTHEIGHT gives
 * the height in real pixels.
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
 * GTI_WINDOWWIDTH, GTI_OUTPUTHEIGHT, GTI_LOGICALHEIGHT
 *
 * $DOCEND$
 */
