/*
 * $DOC$
 * $NAME$
 * GTI_FONTWEIGHT
 *
 * $ONELINER$
 * Query or change the weight of the font
 *
 * $SYNTAX$
 * GtInfo( GTI_FONTWEIGHT, [nWeight] ) --> nWeight
 *
 * $ARGUMENTS$
 * `GTI_FONTWEIGHT` The selector, from gtinfo.ch.
 * `nWeight` GTI_FONTW_THIN, GTI_FONTW_NORMAL or GTI_FONTW_BOLD.
 *
 * $RETURNS$
 * The weight before the call, one of the GTI_FONTW_* constants.
 *
 * $DESCRIPTION$
 * GTWVT uses the new weight when the font is loaded next, for example by GTI_FONTSIZE.
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
 * GTI_FONTNAME, GTI_FONTQUALITY, GTI_FONTSIZE
 *
 * $DOCEND$
 */
