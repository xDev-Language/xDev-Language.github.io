/*
 * $DOC$
 * $NAME$
 * GTI_KBDALT
 *
 * $ONELINER$
 * Query or change the Alt+keypad character entry
 *
 * $SYNTAX$
 * GtInfo( GTI_KBDALT, [lOn] ) --> lOn
 *
 * $ARGUMENTS$
 * `GTI_KBDALT` The selector, from gtinfo.ch.
 * `lOn` .T. turns the Alt+keypad entry on.
 *
 * $RETURNS$
 * NIL in xDev.
 *
 * $DESCRIPTION$
 * The setting lets the user type a character code on the numeric keypad while holding Alt.
 *
 * $NOTES$
 * No xDev GT driver supports it yet: GtInfo() returns NIL and changes nothing.
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
 * GTI_KBDSHIFTS
 *
 * $DOCEND$
 */
