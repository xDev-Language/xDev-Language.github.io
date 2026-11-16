/*
 * $DOC$
 * $NAME$
 * GTI_REDRAWMAX
 *
 * $ONELINER$
 * Query or change how unchanged cells are redrawn
 *
 * $SYNTAX$
 * GtInfo( GTI_REDRAWMAX, [nCells] ) --> nCells
 *
 * $ARGUMENTS$
 * `GTI_REDRAWMAX` The selector, from gtinfo.ch.
 * `nCells` The largest number of unchanged cells between changed ones that are redrawn with them.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * The terminal redraws changed cells in runs. Unchanged cells between two changes are included in
 * one run when there are at most nCells of them.
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
 * GTI_EXPOSEAREA
 *
 * $DOCEND$
 */
