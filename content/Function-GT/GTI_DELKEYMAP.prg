/*
 * $DOC$
 * $NAME$
 * GTI_DELKEYMAP
 *
 * $ONELINER$
 * Remove a key escape sequence
 *
 * $SYNTAX$
 * GtInfo( GTI_DELKEYMAP, aKeyMap ) --> lRemoved
 *
 * $ARGUMENTS$
 * `GTI_DELKEYMAP` The selector, from gtinfo.ch.
 * `aKeyMap` Key codes with their escape sequences.
 *
 * $RETURNS$
 * NIL in xDev.
 *
 * $DESCRIPTION$
 * It removes sequences added by GTI_ADDKEYMAP.
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
