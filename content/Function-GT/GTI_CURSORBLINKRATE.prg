/*
 * $DOC$
 * $NAME$
 * GTI_CURSORBLINKRATE
 *
 * $ONELINER$
 * Query or change the blink rate of the cursor
 *
 * $SYNTAX$
 * GtInfo( GTI_CURSORBLINKRATE, [nMilliseconds] ) --> nMilliseconds
 *
 * $ARGUMENTS$
 * `GTI_CURSORBLINKRATE` The selector, from gtinfo.ch.
 * `nMilliseconds` The time the cursor stays shown and hidden. 0 stops the blinking.
 *
 * $RETURNS$
 * The rate before the call.
 *
 * $DESCRIPTION$
 * The new rate starts with the cursor shown. SetCursor() selects the shape of the cursor.
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
 * SetCursor()
 *
 * $DOCEND$
 */
