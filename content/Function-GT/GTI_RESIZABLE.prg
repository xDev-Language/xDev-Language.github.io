/*
 * $DOC$
 * $NAME$
 * GTI_RESIZABLE
 *
 * $ONELINER$
 * Query or change whether the user can resize the window
 *
 * $SYNTAX$
 * GtInfo( GTI_RESIZABLE, [lResizable] ) --> lResizable
 *
 * $ARGUMENTS$
 * `GTI_RESIZABLE` The selector, from gtinfo.ch.
 * `lResizable` .T. lets the user drag the border of the window.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * GTI_RESIZEFONT tells what happens to the text when the window changes its size, and
 * GTI_RESIZEBLOCK lets the program draw the screen again.
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
 * GTI_RESIZEFONT, GTI_RESIZEBLOCK, GTI_RESIZESTEP
 *
 * $DOCEND$
 */
