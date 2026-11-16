/*
 * $DOC$
 * $NAME$
 * GTI_STDERRCON
 *
 * $ONELINER$
 * Query or change whether error output goes to the screen
 *
 * $SYNTAX$
 * GtInfo( GTI_STDERRCON, [lScreen] ) --> lScreen
 *
 * $ARGUMENTS$
 * `GTI_STDERRCON` The selector, from gtinfo.ch.
 * `lScreen` .T. shows OutErr() output on the screen of the terminal.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * A program in a graphics window has no console of its own. With .T. the output of OutErr()
 * appears on its screen.
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
 * GTI_STDOUTCON, GTI_ERRORFD
 *
 * $DOCEND$
 */
