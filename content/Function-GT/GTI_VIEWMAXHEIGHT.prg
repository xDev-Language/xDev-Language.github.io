/*
 * $DOC$
 * $NAME$
 * GTI_VIEWMAXHEIGHT
 *
 * $ONELINER$
 * Return the largest number of visible rows
 *
 * $SYNTAX$
 * GtInfo( GTI_VIEWMAXHEIGHT ) --> nRows
 *
 * $ARGUMENTS$
 * `GTI_VIEWMAXHEIGHT` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The number of rows that the window can show.
 *
 * $DESCRIPTION$
 * In the xDev graphics drivers it is the number of rows of the screen, as MaxRow() + 1.
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
 * GTI_VIEWMAXWIDTH, GTI_VIEWPORTHEIGHT, MaxRow()
 *
 * $DOCEND$
 */
