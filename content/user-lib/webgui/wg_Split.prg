/*
 * $DOC$
 * $NAME$
 * wg_Split
 *
 * $ONELINER$
 * Divide a layout into two resizable columns
 *
 * $SYNTAX$
 * wg_Split():New( oParent, [nPosition] ) --> oSplit
 * oSplit:Panel( nPart ) --> oColumn
 * oSplit:onChange := {| oSplit | ... }
 *
 * $ARGUMENTS$
 * `oParent` Window or layout container.
 * `nPosition` Initial width of the left column in logical pixels. The default is 300.
 * `nPart` 1 for the left column or 2 for the right column.
 *
 * $RETURNS$
 * `New()` returns the split. `Panel()` returns the requested `wg_Column`.
 *
 * $DESCRIPTION$
 * The split takes the remaining space in its parent. Pass the columns returned by `Panel()` as parents of the controls in each part. The user can drag the divider between them. `:value` contains the left column's width and can be assigned from xDev. `onChange` runs when the user releases the divider.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wg_Column, wg_Control, wg_Sidebar
 *
 * $DOCEND$
 */
