/*
 * $DOC$
 * $NAME$
 * GTI_ERRORFD
 *
 * $ONELINER$
 * Return the error output handle of the terminal
 *
 * $SYNTAX$
 * GtInfo( GTI_ERRORFD ) --> nHandle
 *
 * $ARGUMENTS$
 * `GTI_ERRORFD` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The handle of the standard error output of the terminal.
 *
 * $DESCRIPTION$
 * OutErr() writes to this handle.
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
 * GTI_INPUTFD, GTI_OUTPUTFD, GTI_STDERRCON
 *
 * $DOCEND$
 */
