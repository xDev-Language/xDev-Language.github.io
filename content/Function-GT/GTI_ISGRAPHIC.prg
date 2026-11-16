/*
 * $DOC$
 * $NAME$
 * GTI_ISGRAPHIC
 *
 * $ONELINER$
 * Tell whether the terminal can draw in pixels
 *
 * $SYNTAX$
 * GtInfo( GTI_ISGRAPHIC ) --> lGraphic
 *
 * $ARGUMENTS$
 * `GTI_ISGRAPHIC` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * .T. when the GT driver draws in a window of pixels.
 *
 * $DESCRIPTION$
 * A graphics terminal also supports GfxPrimitive(), GfxText() and the pixel sizes such as
 * GTI_SCREENWIDTH.
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
 * GTI_SCREENWIDTH, GTI_SCREENHEIGHT, GfxPrimitive()
 *
 * $DOCEND$
 */
