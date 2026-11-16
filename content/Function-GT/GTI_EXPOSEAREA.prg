/*
 * $DOC$
 * $NAME$
 * GTI_EXPOSEAREA
 *
 * $ONELINER$
 * Paint text cells again over graphics
 *
 * $SYNTAX$
 * GtInfo( GTI_EXPOSEAREA, aArea ) --> lDone
 *
 * $ARGUMENTS$
 * `GTI_EXPOSEAREA` The selector, from gtinfo.ch.
 * `aArea` The cells as { nTop, nLeft, nBottom, nRight }.
 *
 * $RETURNS$
 * .T. when the area was valid.
 *
 * $DESCRIPTION$
 * The cells of the area are drawn again from the screen buffer, so text comes back over pixels
 * drawn by GfxPrimitive() or GTI_DISPIMAGE.
 *
 * $NOTES$
 * Handled by the terminal layer, so it works with every GT driver.
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
 * GTI_DISPIMAGE, GfxPrimitive()
 *
 * $DOCEND$
 */
