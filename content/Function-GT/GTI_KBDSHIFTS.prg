/*
 * $DOC$
 * $NAME$
 * GTI_KBDSHIFTS
 *
 * $ONELINER$
 * Query or change the state of the shift and lock keys
 *
 * $SYNTAX$
 * GtInfo( GTI_KBDSHIFTS, [nShifts] ) --> nShifts
 *
 * $ARGUMENTS$
 * `GTI_KBDSHIFTS` The selector, from gtinfo.ch.
 * `nShifts` New states of the lock keys as GTI_KBD_* flags.
 *
 * $RETURNS$
 * The pressed keys and the active lock keys as a sum of GTI_KBD_* flags.
 *
 * $DESCRIPTION$
 * The flags are defined in gtinfo.ch:
 *
 * | Flag | Key |
 * |---|---|
 * | GTI_KBD_SHIFT, GTI_KBD_LSHIFT, GTI_KBD_RSHIFT | Shift, left and right |
 * | GTI_KBD_CTRL, GTI_KBD_LCTRL, GTI_KBD_RCTRL | Ctrl, left and right |
 * | GTI_KBD_ALT, GTI_KBD_LALT, GTI_KBD_RALT | Alt, left and right |
 * | GTI_KBD_LWIN, GTI_KBD_RWIN, GTI_KBD_MENU | Windows and menu keys |
 * | GTI_KBD_SCROLOCK, GTI_KBD_NUMLOCK, GTI_KBD_CAPSLOCK | the lock keys |
 * | GTI_KBD_INSERT | Insert mode |
 * | GTI_KBD_KEYPAD | a key of the numeric keypad |
 *
 * A new value can only switch the lock keys.
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
 * Inkey(), GTI_KBDSUPPORT
 *
 * $DOCEND$
 */
