/*
 * $DOC$
 * $NAME$
 * guiBrowse
 *
 * $ONELINER$
 * Browse records in rows and columns
 *
 * $SYNTAX$
 * guiBrowse():New( oWindow, nX, nY, [nWidth], [nHeight] ) --> oBrowse
 * oBrowse:AddColumn( cHeading, bBlock, [nWidth], [cPicture], [nAlign] ) --> nColumn
 * oBrowse:Refresh() --> oBrowse
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
 * Class members declared by `guiBrowse`:
 *
 * - Instance variables: `goTopBlock` (read/write), `goBottomBlock` (read/write), `skipBlock`
 *   (read/write), `positionBlock` (read/write), `onChange` (read/write), `onDoubleClick`
 *   (read/write), `columns` (internal), `emptyBlock` (read/write)
 * - Properties: `freeze` (read/write), `colPos` (read/write), `headerBackground` (read/write),
 *   `headerForeground` (read/write), `headerLine` (read/write), `background` (read/write),
 *   `alternateBackground` (read/write), `foreground` (read/write), `gridLine` (read/write),
 *   `cursorBackground` (read/write), `cursorForeground` (read/write), `inactiveCursor`
 *   (read/write), `checkForeground` (read/write)
 * - Methods: `New()`, `AddColumn()`, `Refresh()`
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
 * A browse reads records through `goTopBlock`, `goBottomBlock` and `skipBlock`. A column block returns the value of the current record. A logical get/set block may also accept the new value after the user toggles it. Refresh() reads the visible rows again after the record or data changes. `onChange` and `onDoubleClick` receive the browse.
 *
 * Navigation members are `freeze`, `colPos`, `positionBlock` and `emptyBlock`. Color members are `headerBackground`, `headerForeground`, `headerLine`, `background`, `alternateBackground`, `foreground`, `gridLine`, `cursorBackground`, `cursorForeground`, `inactiveCursor` and `checkForeground`.
 *
 * $NOTES$
 * guiBrowse is part of the `gui` user library for Windows.
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
 * guiControl, guiListView, TBColumn
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aRows := { { "One", 10 }, { "Two", 20 } }
   LOCAL nRow := 1
   LOCAL oWindow := guiWindow():New( "Browse", 460, 260 )
   LOCAL oBrowse := guiBrowse():New( oWindow, 20, 20, 420, 220 )

   oBrowse:goTopBlock := {|| nRow := 1 }
   oBrowse:goBottomBlock := {|| nRow := Len( aRows ) }
   oBrowse:skipBlock := {| n, nOld | nOld := nRow, nRow := Max( 1, Min( Len( aRows ), nRow + n ) ), nRow - nOld }
   oBrowse:AddColumn( "Name", {|| aRows[ nRow, 1 ] }, 20 )
   oBrowse:AddColumn( "Value", {|| aRows[ nRow, 2 ] }, 10 )
   guiApplication():Run( oWindow )

RETURN

