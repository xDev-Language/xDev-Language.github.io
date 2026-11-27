/*
 * $DOC$
 * $NAME$
 * guiListBox
 *
 * $ONELINER$
 * Select an item from a list of text
 *
 * $SYNTAX$
 * guiListBox():New( oWindow, nX, nY, [nWidth], [nHeight] ) --> oList
 * oList:Add( cText ) --> nPosition
 * oList:Clear() --> oList
 * oList:Item( nPosition ) --> cText
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
 * Class members declared by `guiListBox`:
 *
 * - Instance variables: `onSelect` (read/write), `onDoubleClick` (read/write)
 * - Properties: `count` (read-only), `selected` (read/write), `value` (read/write),
 *   `selectedText` (read-only)
 * - Methods: `New()`, `Add()`, `Clear()`, `Item()`
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
 * Items have 1-based positions. Add() appends an item, Item() returns its text, and Clear() removes all items. `onSelect` and `onDoubleClick` receive the control.
 *
 * `count` is the number of items. `selected` and `value` are the selected position, or 0. `selectedText` is the selected text, or an empty string.
 *
 * $NOTES$
 * guiListBox is part of the `gui` user library for Windows.
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
 * guiComboBox, guiListView, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "List", 360, 240 )
   LOCAL oList := guiListBox():New( oWindow, 30, 25, 300, 170 )

   oList:Add( "First" )
   oList:Add( "Second" )
   oList:selected := 1
   guiApplication():Run( oWindow )

RETURN

