/*
 * $DOC$
 * $NAME$
 * GTI_FONTATTRIBUTE
 *
 * $ONELINER$
 * Query or change how characters are drawn
 *
 * $SYNTAX$
 * GtInfo( GTI_FONTATTRIBUTE, [nAttributes] ) --> nAttributes
 *
 * $ARGUMENTS$
 * `GTI_FONTATTRIBUTE` The selector, from gtinfo.ch.
 * `nAttributes` A sum of GTI_FONTA_* flags.
 *
 * $RETURNS$
 * The flags before the call.
 *
 * $DESCRIPTION$
 * The flags are defined in gtinfo.ch:
 *
 * | Flag | Meaning |
 * |---|---|
 * | GTI_FONTA_FIXMETRIC | every character takes the same width |
 * | GTI_FONTA_CLRBKG | the background of a cell is cleared before the character |
 * | GTI_FONTA_DRAWBOX | the driver draws box and block characters itself, so the lines meet |
 * | GTI_FONTA_CTRLCHARS | the characters below 32 are shown as symbols |
 * | GTI_FONTA_NOSTRETCH | characters are not stretched to the cell |
 *
 * GTSDL3 and GTGLFW always draw with GTI_FONTA_FIXMETRIC and GTI_FONTA_CLRBKG and keep no other
 * flags.
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
 * GTI_FONTNAME, DispBox()
 *
 * $DOCEND$
 */
