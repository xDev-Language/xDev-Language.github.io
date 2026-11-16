/*
 * $DOC$
 * $NAME$
 * GTI_GETWIN
 *
 * $ONELINER$
 * Save the screen and the cursor
 *
 * $SYNTAX$
 * GtInfo( GTI_GETWIN ) --> aState
 *
 * $ARGUMENTS$
 * `GTI_GETWIN` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * An array of seven elements: cursor row, cursor column, cursor shape, MaxRow(), MaxCol(), the
 * screen contents, and NIL.
 *
 * $DESCRIPTION$
 * Pass the array later to GTI_SETWIN to restore the screen and the cursor.
 *
 * $NOTES$
 * Handled by the terminal layer, so it works with every GT driver.
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
 * GTI_SETWIN, GTI_NEWWIN, SaveScreen()
 *
 * $DOCEND$
 */
