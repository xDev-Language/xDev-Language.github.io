/*
 * $DOC$
 * $NAME$
 * GTI_VIEWMAXWIDTH
 *
 * $ONELINER$
 * Return the largest number of visible columns
 *
 * $SYNTAX$
 * GtInfo( GTI_VIEWMAXWIDTH ) --> nColumns
 *
 * $ARGUMENTS$
 * `GTI_VIEWMAXWIDTH` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The number of columns that the window can show.
 *
 * $DESCRIPTION$
 * In the xDev graphics drivers it is the number of columns of the screen, as MaxCol() + 1.
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
 * GTI_VIEWMAXHEIGHT, GTI_VIEWPORTWIDTH, MaxCol()
 *
 * $DOCEND$
 */
