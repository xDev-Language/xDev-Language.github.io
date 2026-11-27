/*
 * $DOC$
 * $NAME$
 * GTI_FONTQUALITY
 *
 * $ONELINER$
 * Query or change the rendering quality of the font
 *
 * $SYNTAX$
 * GtInfo( GTI_FONTQUALITY, [nQuality] ) --> nQuality
 *
 * $ARGUMENTS$
 * `GTI_FONTQUALITY` The selector, from gtinfo.ch.
 * `nQuality` GTI_FONTQ_DRAFT, GTI_FONTQ_NORMAL or GTI_FONTQ_HIGH.
 *
 * $RETURNS$
 * The quality before the call, one of the GTI_FONTQ_* constants.
 *
 * $DESCRIPTION$
 * GTI_FONTQ_HIGH smooths the edges of the characters, GTI_FONTQ_DRAFT draws them without
 * smoothing.
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
 * GTI_FONTWEIGHT, GTI_FONTNAME
 *
 * $DOCEND$
 */
