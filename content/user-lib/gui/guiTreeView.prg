/*
 * $DOC$
 * $NAME$
 * guiTreeView
 *
 * $ONELINER$
 * Show hierarchical text items
 *
 * $SYNTAX$
 * guiTreeView():New( oWindow, nX, nY, [nWidth], [nHeight] ) --> oTree
 * oTree:Add( cText, [hParent] ) --> hItem
 * oTree:ItemText( hItem ) --> cText
 * oTree:SetItemText( hItem, cText ) --> oTree
 * oTree:Expand( hItem ) --> oTree
 * oTree:Collapse( hItem ) --> oTree
 * oTree:Clear() --> oTree
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
 * Class members declared by `guiTreeView`:
 *
 * - Instance variables: `onSelect` (read/write), `onDoubleClick` (read/write)
 * - Properties: `count` (read-only), `selected` (read/write), `value` (read/write)
 * - Methods: `New()`, `Add()`, `ItemText()`, `SetItemText()`, `Expand()`, `Collapse()`,
 *   `Clear()`
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
 * Add() appends an item at the root or below `hParent` and returns its handle. The handle remains valid until Clear(). Expand() shows children and Collapse() hides them. `onSelect` and `onDoubleClick` receive the control.
 *
 * `count` is the number of items. `selected` and `value` contain the selected handle, or NIL.
 *
 * $NOTES$
 * guiTreeView is part of the `gui` user library for Windows.
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
 * guiListView, guiSidebar, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Tree", 420, 260 )
   LOCAL oTree := guiTreeView():New( oWindow, 20, 20, 380, 220 )
   LOCAL hRoot := oTree:Add( "Project" )

   oTree:Add( "src", hRoot )
   oTree:Add( "README.md", hRoot )
   oTree:Expand( hRoot )
   guiApplication():Run( oWindow )

RETURN

