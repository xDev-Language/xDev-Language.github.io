/*
 * $DOC$
 * $NAME$
 * GTI_FONTSEL
 *
 * $ONELINER$
 * Query or change the font by an X11 font description
 *
 * $SYNTAX$
 * GtInfo( GTI_FONTSEL, [cFont] ) --> cFont
 *
 * $ARGUMENTS$
 * `GTI_FONTSEL` The selector, from gtinfo.ch.
 * `cFont` An X11 font description.
 *
 * $RETURNS$
 * The description before the call. Drivers other than GTXWC return an empty string or NIL.
 *
 * $DESCRIPTION$
 * Only GTXWC uses X11 font descriptions. The other drivers select the font with GTI_FONTNAME.
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
 * GTI_FONTNAME
 *
 * $DOCEND$
 */
