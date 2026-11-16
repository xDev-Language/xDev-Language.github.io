/*
 * $DOC$
 * $NAME$
 * GTI_ADDKEYMAP
 *
 * $ONELINER$
 * Add a key escape sequence
 *
 * $SYNTAX$
 * GtInfo( GTI_ADDKEYMAP, aKeyMap ) --> lAdded
 *
 * $ARGUMENTS$
 * `GTI_ADDKEYMAP` The selector, from gtinfo.ch.
 * `aKeyMap` Key codes with their escape sequences.
 *
 * $RETURNS$
 * NIL in xDev.
 *
 * $DESCRIPTION$
 * Text terminals use this table to recognize the escape sequences of special keys.
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
 * GTI_DELKEYMAP, GTI_ESCDELAY
 *
 * $DOCEND$
 */
