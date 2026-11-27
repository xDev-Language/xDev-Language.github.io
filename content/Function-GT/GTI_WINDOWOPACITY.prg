/*
 * $DOC$
 * $NAME$
 * GTI_WINDOWOPACITY
 *
 * $ONELINER$
 * Query or change the opacity of the window
 *
 * $SYNTAX$
 * GtInfo( GTI_WINDOWOPACITY, [nOpacity] ) --> nOpacity
 *
 * $ARGUMENTS$
 * `GTI_WINDOWOPACITY` The selector, from gtinfo.ch.
 * `nOpacity` From 0.0, invisible, to 1.0, opaque.
 *
 * $RETURNS$
 * The opacity before the call.
 *
 * $DESCRIPTION$
 * A value outside the range is set to the nearest limit.
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
 * GTI_WINDOWALWAYSONTOP
 *
 * $DOCEND$
 */
