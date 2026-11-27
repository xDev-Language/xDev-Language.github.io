/*
 * $DOC$
 * $NAME$
 * GTI_FONTNAME
 *
 * $ONELINER$
 * Query or change the name of the font
 *
 * $SYNTAX$
 * GtInfo( GTI_FONTNAME, [cName] ) --> cName
 *
 * $ARGUMENTS$
 * `GTI_FONTNAME` The selector, from gtinfo.ch.
 * `cName` The name of an installed monospaced font, for example "Consolas".
 *
 * $RETURNS$
 * The name before the call.
 *
 * $DESCRIPTION$
 * GTWVT uses the new name when the font is loaded next, for example by GTI_FONTSIZE.
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
 * GTI_FONTSIZE, GTI_FONTWEIGHT, GTI_FONTSEL
 *
 * $DOCEND$
 */
