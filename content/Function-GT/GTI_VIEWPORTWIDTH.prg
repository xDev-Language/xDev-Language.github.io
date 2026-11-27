/*
 * $DOC$
 * $NAME$
 * GTI_VIEWPORTWIDTH
 *
 * $ONELINER$
 * Return the number of columns in view
 *
 * $SYNTAX$
 * GtInfo( GTI_VIEWPORTWIDTH ) --> nColumns
 *
 * $ARGUMENTS$
 * `GTI_VIEWPORTWIDTH` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The number of columns shown now.
 *
 * $DESCRIPTION$
 * In the xDev graphics drivers the whole screen is always in view, so the value equals
 * GTI_VIEWMAXWIDTH.
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
 * GTI_VIEWPORTHEIGHT, GTI_VIEWMAXWIDTH
 *
 * $DOCEND$
 */
