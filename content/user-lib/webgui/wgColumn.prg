/*
 * $DOC$
 * $NAME$
 * wgColumn
 *
 * $ONELINER$
 * Lay out controls vertically
 *
 * $SYNTAX$
 * wgColumn():New( oParent ) --> oColumn
 *
 * $ARGUMENTS$
 * `oParent` Window or layout container.
 *
 * $RETURNS$
 * The column object.
 *
 * $DESCRIPTION$
 * Pass the column as the parent of its child controls. It stacks them from top to bottom in creation order. Children with `:grow := .T.` share the remaining height. `wgSplit:Panel()` also returns a column.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wgBox, wgControl, wgRow, wgSplit
 *
 * $DOCEND$
 */
