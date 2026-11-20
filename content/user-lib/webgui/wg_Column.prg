/*
 * $DOC$
 * $NAME$
 * wg_Column
 *
 * $ONELINER$
 * Lay out controls vertically
 *
 * $SYNTAX$
 * wg_Column():New( oParent ) --> oColumn
 *
 * $ARGUMENTS$
 * `oParent` Window or layout container.
 *
 * $RETURNS$
 * The column object.
 *
 * $DESCRIPTION$
 * Pass the column as the parent of its child controls. It stacks them from top to bottom in creation order. Children with `:grow := .T.` share the remaining height. `wg_Split:Panel()` also returns a column.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wg_Box, wg_Control, wg_Row, wg_Split
 *
 * $DOCEND$
 */
