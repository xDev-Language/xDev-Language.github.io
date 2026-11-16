/*
 * $DOC$
 * $NAME$
 * GTI_PALETTE
 *
 * $ONELINER$
 * Query or change the 16 colors of the text
 *
 * $SYNTAX$
 * GtInfo( GTI_PALETTE, [aColors] ) --> aColors
 * GtInfo( GTI_PALETTE, nIndex, [nColor] ) --> nColor
 *
 * $ARGUMENTS$
 * `GTI_PALETTE` The selector, from gtinfo.ch.
 * `aColors` An array of 16 new colors.
 * `nIndex` The number of one color from 0 to 15.
 * `nColor` The new value of this color.
 *
 * $RETURNS$
 * The colors before the call, all 16 as an array or the one selected by nIndex.
 *
 * $DESCRIPTION$
 * The 16 colors are the colors of color strings such as "W+/B": 0 is N, 1 is B, up to 15 for W+.
 * A color value is 0xBBGGRR, with red in the lowest byte, unlike the 0xRRGGBB colors of
 * GfxPrimitive(). Text already on the screen takes the new colors at once.
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
 * SetColor(), GfxPrimitive()
 *
 * $DOCEND$
 */
