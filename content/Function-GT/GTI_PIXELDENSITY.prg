/*
 * $DOC$
 * $NAME$
 * GTI_PIXELDENSITY
 *
 * $ONELINER$
 * Return the pixels of the display per window unit
 *
 * $SYNTAX$
 * GtInfo( GTI_PIXELDENSITY ) --> nDensity
 *
 * $ARGUMENTS$
 * `GTI_PIXELDENSITY` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * GTI_OUTPUTWIDTH divided by GTI_WINDOWWIDTH, for example 2.0 on a Retina display. GTWVT returns
 * 1.0.
 *
 * $DESCRIPTION$
 * It shows how many real pixels the system draws for one unit of the window size.
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
 * GTI_DISPLAYSCALE, GTI_CONTENTSCALE
 *
 * $DOCEND$
 */
