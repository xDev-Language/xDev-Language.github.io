/*
 * $DOC$
 * $NAME$
 * GTI_SETWIN
 *
 * $ONELINER$
 * Restore a screen saved with GTI_GETWIN
 *
 * $SYNTAX$
 * GtInfo( GTI_SETWIN, aState ) --> lRestored
 *
 * $ARGUMENTS$
 * `GTI_SETWIN` The selector, from gtinfo.ch.
 * `aState` The array returned by GTI_GETWIN or GTI_NEWWIN.
 *
 * $RETURNS$
 * .T. when the screen was restored, .F. for an invalid array.
 *
 * $DESCRIPTION$
 * The screen contents, the cursor position and the cursor shape come back.
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
 * GTI_GETWIN, GTI_NEWWIN
 *
 * $DOCEND$
 */
