/*
 * $DOC$
 * $NAME$
 * GTI_INPUTFD
 *
 * $ONELINER$
 * Return the input handle of the terminal
 *
 * $SYNTAX$
 * GtInfo( GTI_INPUTFD ) --> nHandle
 *
 * $ARGUMENTS$
 * `GTI_INPUTFD` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The low-level handle that the terminal reads from.
 *
 * $DESCRIPTION$
 * GTXWC returns the connection to the X server. Use it to wait for input together with other
 * handles.
 *
 * $NOTES$
 * Supported only by GTXWC. Other drivers return NIL.
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
 * GTI_OUTPUTFD, GTI_ERRORFD
 *
 * $DOCEND$
 */
