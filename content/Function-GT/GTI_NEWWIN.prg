/*
 * $DOC$
 * $NAME$
 * GTI_NEWWIN
 *
 * $ONELINER$
 * Redraw a rectangular area of the text screen
 *
 * $SYNTAX$
 * GtInfo( GTI_NEWWIN, aArea ) --> lDone
 *
 * $ARGUMENTS$
 * `GTI_NEWWIN` The selector, from gtinfo.ch.
 * `aArea` Four zero-based cell coordinates { nTop, nLeft, nBottom, nRight }.
 *
 * $RETURNS$
 * .T. when the terminal accepts the four numeric coordinates for redrawing.
 * An omitted or malformed area returns .F.
 *
 * $DESCRIPTION$
 * The current runtime handles this selector through the same redraw operation as GTI_EXPOSEAREA.
 * To save the screen and cursor for later restoration, use GTI_GETWIN.
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
 * GTI_EXPOSEAREA, GTI_GETWIN, GTI_SETWIN
 *
 * $DOCEND$
 */
