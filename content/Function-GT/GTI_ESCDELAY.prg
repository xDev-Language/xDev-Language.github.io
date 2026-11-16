/*
 * $DOC$
 * $NAME$
 * GTI_ESCDELAY
 *
 * $ONELINER$
 * Query or change the delay of the Esc key
 *
 * $SYNTAX$
 * GtInfo( GTI_ESCDELAY, [nMilliseconds] ) --> nMilliseconds
 *
 * $ARGUMENTS$
 * `GTI_ESCDELAY` The selector, from gtinfo.ch.
 * `nMilliseconds` How long the terminal waits after Esc for the rest of an escape sequence.
 *
 * $RETURNS$
 * NIL in xDev.
 *
 * $DESCRIPTION$
 * Text terminals use this delay to tell the Esc key from the start of a key sequence.
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
 * GTI_ADDKEYMAP
 *
 * $DOCEND$
 */
