/*
 * $DOC$
 * $NAME$
 * GTI_STDOUTCON
 *
 * $ONELINER$
 * Query or change whether standard output goes to the screen
 *
 * $SYNTAX$
 * GtInfo( GTI_STDOUTCON, [lScreen] ) --> lScreen
 *
 * $ARGUMENTS$
 * `GTI_STDOUTCON` The selector, from gtinfo.ch.
 * `lScreen` .T. shows OutStd() output on the screen of the terminal.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * A program in a graphics window has no console of its own. With .T. the output of OutStd()
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
 * GTI_STDERRCON, GTI_OUTPUTFD
 *
 * $DOCEND$
 */
