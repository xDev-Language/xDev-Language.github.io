/*
 * $DOC$
 * $NAME$
 * GTI_WINDOWWIDTH
 *
 * $ONELINER$
 * Return the width of the window area
 *
 * $SYNTAX$
 * GtInfo( GTI_WINDOWWIDTH ) --> nWidth
 *
 * $ARGUMENTS$
 * `GTI_WINDOWWIDTH` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The width of the client area of the window in the units of the system.
 *
 * $DESCRIPTION$
 * On a scaled display the system can count in units larger than a pixel. GTI_OUTPUTWIDTH gives
 * the width in real pixels.
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
 * GTI_WINDOWHEIGHT, GTI_OUTPUTWIDTH, GTI_LOGICALWIDTH
 *
 * $DOCEND$
 */
