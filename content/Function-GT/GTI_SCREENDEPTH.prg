/*
 * $DOC$
 * $NAME$
 * GTI_SCREENDEPTH
 *
 * $ONELINER$
 * Return the number of color bits of the window
 *
 * $SYNTAX$
 * GtInfo( GTI_SCREENDEPTH ) --> nBits
 *
 * $ARGUMENTS$
 * `GTI_SCREENDEPTH` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The bits per pixel of the window. The xDev graphics drivers return 32.
 *
 * $DESCRIPTION$
 * The window keeps 24-bit colors, so every color 0xRRGGBB is shown exactly.
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
 * GTI_DESKTOPDEPTH
 *
 * $DOCEND$
 */
