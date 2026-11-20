/*
 * $DOC$
 * $NAME$
 * wg_Browse
 *
 * $ONELINER$
 * Display an array in a table with a current row
 *
 * $SYNTAX$
 * wg_Browse():New( oParent ) --> oBrowse
 * oBrowse:AddColumn( cHeading, bBlock, [nWidth], [cPicture], [nAlign] ) --> nColumn
 * oBrowse:SetArray( aRows ) --> oBrowse
 * oBrowse:Refresh() --> oBrowse
 * oBrowse:onChange := {| oBrowse | ... }
 * oBrowse:onClick := {| oBrowse | ... }
 *
 * $ARGUMENTS$
 * `oParent` Window or layout container.
 * `cHeading` Heading text.
 * `bBlock` Block that receives an element of `aRows` and its one-based index. Return the cell value.
 * `nWidth` Optional column width in logical pixels.
 * `cPicture` Optional picture passed to `Transform()` when formatting the cell.
 * `nAlign` Alignment. Use 0 for left, 1 for right or 2 for center. By default a column is right-aligned if its first row returns a number and left-aligned otherwise.
 * `aRows` Array whose elements are shown as rows.
 *
 * $RETURNS$
 * `New()` returns the browse. `AddColumn()` returns the one-based column number. `SetArray()` and `Refresh()` return the browse.
 *
 * $DESCRIPTION$
 * Add columns and call `SetArray()`. The table keeps the array and displays rows in array order. Cell blocks can return text, numbers, dates or logical values. Call `Refresh()` to rebuild the display after editing the array.
 *
 * `:value` is the one-based index of the current row. `SetArray()` selects row 1 when the array has rows and sets `:value` to 0 when it is empty. Clicking a row or pressing Up, Down, Page Up, Page Down, Home or End can change the current row and run `onChange`. Double-clicking a row or pressing Enter runs `onClick`.
 *
 * The heading stays visible while vertically scrolling. The default height is 200 logical pixels. Use `:height` to set a height or `:grow := .T.` to fill the remaining space in a column.
 *
 * $NOTES$
 * See `webgui-browse.prg` in Examples.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wg_Control, wg_Column, Transform
 *
 * $DOCEND$
 */
