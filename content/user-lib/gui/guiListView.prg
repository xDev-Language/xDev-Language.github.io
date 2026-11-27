/*
 * $DOC$
 * $NAME$
 * guiListView
 *
 * $ONELINER$
 * Show rows of text in columns
 *
 * $SYNTAX$
 * guiListView():New( oWindow, nX, nY, [nWidth], [nHeight] ) --> oList
 * oList:AddColumn( cTitle, [nWidth], [nAlign] ) --> nColumn
 * oList:AddRow( aValues ) --> nRow
 * oList:Cell( nRow, nColumn ) --> cText
 * oList:SetCell( nRow, nColumn, cText ) --> oList
 * oList:Delete( nRow ) --> oList
 * oList:Clear() --> oList
 *
 * $ARGUMENTS$
 * Arguments are described by the signatures above. Positions and sizes are
 * logical pixels. Optional arguments in brackets use the defaults described
 * below.
 *
 * $RETURNS$
 * Constructors return the new object unless the syntax states otherwise.
 * Methods returning the object may be chained.
 *
 * $DESCRIPTION$
 * Class members declared by `guiListView`:
 *
 * - Instance variables: `onSelect` (read/write), `onDoubleClick` (read/write)
 * - Properties: `count` (read-only), `columnCount` (read-only), `selected` (read/write), `value`
 *   (read/write)
 * - Methods: `New()`, `AddColumn()`, `AddRow()`, `Cell()`, `SetCell()`, `Delete()`, `Clear()`
 *
 * Inherited from `guiControl`:
 *
 * - Instance variables: `handle` (read-only), `parent` (read-only), `name` (read/write)
 * - Properties: `focused` (read-only), `font` (read/write), `text` (read/write), `value`
 *   (read/write), `x` (read/write), `y` (read/write), `width` (read/write), `height`
 *   (read/write), `toolTip` (read/write), `contextMenu` (read/write), `visible` (read/write),
 *   `enabled` (read/write), `anchor` (read/write)
 * - Methods: `SetFocus()`, `Destroy()`
 *
 * AddColumn() creates a column; alignment is 0 left, 1 right or 2 centre. AddRow() appends texts for the first columns. Cell() and SetCell() read and change cells. Delete() removes one row and Clear() removes all rows without removing columns. `onSelect` and `onDoubleClick` receive the control.
 *
 * `count` is the row count and `columnCount` is the column count. `selected` and `value` are the selected row, or 0.
 *
 * $NOTES$
 * guiListView is part of the `gui` user library for Windows.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries GUI
 *
 * $HEADER$
 *
 * $SEEALSO$
 * guiTreeView, guiBrowse, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "List view", 480, 260 )
   LOCAL oList := guiListView():New( oWindow, 20, 20, 440, 220 )

   oList:AddColumn( "Name", 260 )
   oList:AddColumn( "Value", 120, 1 )
   oList:AddRow( { "First", "10" } )
   oList:AddRow( { "Second", "20" } )
   guiApplication():Run( oWindow )

RETURN

