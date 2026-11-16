/*
 * $DOC$
 * $NAME$
 * GTI_KBDSUPPORT
 *
 * $ONELINER$
 * Tell whether the terminal reads the keyboard
 *
 * $SYNTAX$
 * GtInfo( GTI_KBDSUPPORT ) --> lSupported
 *
 * $ARGUMENTS$
 * `GTI_KBDSUPPORT` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * .T. when Inkey() can read keys from this terminal.
 *
 * $DESCRIPTION$
 * A terminal without keyboard input can only write output.
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
 * GTI_ISSCREENPOS, Inkey()
 *
 * $DOCEND$
 */
