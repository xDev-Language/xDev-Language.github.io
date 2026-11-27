/*
 * $DOC$
 * $NAME$
 * GTI_MOUSESTATUS
 *
 * $ONELINER$
 * Query or change whether the mouse is used
 *
 * $SYNTAX$
 * GtInfo( GTI_MOUSESTATUS, [lOn] ) --> lOn
 *
 * $ARGUMENTS$
 * `GTI_MOUSESTATUS` The selector, from gtinfo.ch.
 * `lOn` .T. turns the mouse on, .F. turns it off.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * With the mouse turned off the terminal reports no mouse events to Inkey().
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
 * GTI_MOUSEPOS_XY, Inkey()
 *
 * $DOCEND$
 */
