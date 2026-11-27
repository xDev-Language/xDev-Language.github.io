/*
 * $DOC$
 * $NAME$
 * GTI_RESIZEFONT
 *
 * $ONELINER$
 * Query or change what follows a new window size
 *
 * $SYNTAX$
 * GtInfo( GTI_RESIZEFONT, [lFont] ) --> lFont
 *
 * $ARGUMENTS$
 * `GTI_RESIZEFONT` The selector, from gtinfo.ch.
 * `lFont` .T. changes the font size, .F. changes the number of rows and columns.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * When the window changes its size, either the font grows or shrinks and the screen keeps its
 * rows and columns, or the font stays and the screen gets more or fewer rows and columns.
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
 * GTI_RESIZABLE, GTI_RESIZEBLOCK, GTI_SCREENWIDTH
 *
 * $DOCEND$
 */
