/*
 * $DOC$
 * $NAME$
 * GTI_CLIPBOARDPASTE
 *
 * $ONELINER$
 * Paste the clipboard into the keyboard buffer
 *
 * $SYNTAX$
 * GtInfo( GTI_CLIPBOARDPASTE ) --> lPasted
 *
 * $ARGUMENTS$
 * `GTI_CLIPBOARDPASTE` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * .T. when the clipboard held text.
 *
 * $DESCRIPTION$
 * The characters of the clipboard are added to the keyboard buffer, so the next Inkey() calls and
 * READ receive them as typed keys.
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
 * GTI_CLIPBOARDDATA, Inkey()
 *
 * $DOCEND$
 */
