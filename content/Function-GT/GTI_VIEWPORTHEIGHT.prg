/*
 * $DOC$
 * $NAME$
 * GTI_VIEWPORTHEIGHT
 *
 * $ONELINER$
 * Return the number of rows in view
 *
 * $SYNTAX$
 * GtInfo( GTI_VIEWPORTHEIGHT ) --> nRows
 *
 * $ARGUMENTS$
 * `GTI_VIEWPORTHEIGHT` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The number of rows shown now.
 *
 * $DESCRIPTION$
 * In the xDev graphics drivers the whole screen is always in view, so the value equals
 * GTI_VIEWMAXHEIGHT.
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
 * GTI_VIEWPORTWIDTH, GTI_VIEWMAXHEIGHT
 *
 * $DOCEND$
 */
