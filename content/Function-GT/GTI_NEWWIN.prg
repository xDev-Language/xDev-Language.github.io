/*
 * $DOC$
 * $NAME$
 * GTI_NEWWIN
 *
 * $ONELINER$
 * Clear the screen and return the state before
 *
 * $SYNTAX$
 * GtInfo( GTI_NEWWIN ) --> aState
 *
 * $ARGUMENTS$
 * `GTI_NEWWIN` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The state before the call, as GTI_GETWIN returns it.
 *
 * $DESCRIPTION$
 * GTI_NEWWIN saves the screen, clears it and puts the cursor at 0, 0 with the normal shape. Pass
 * the result to GTI_SETWIN to go back.
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
 * GTI_GETWIN, GTI_SETWIN
 *
 * $DOCEND$
 */
