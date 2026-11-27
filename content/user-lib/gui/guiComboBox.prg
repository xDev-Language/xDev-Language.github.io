/*
 * $DOC$
 * $NAME$
 * guiComboBox
 *
 * $ONELINER$
 * Select text from a drop-down list
 *
 * $SYNTAX$
 * guiComboBox():New( oWindow, nX, nY, [nWidth], [nHeight] ) --> oComboBox
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
 * Class members declared by `guiComboBox`:
 *
 * - Instance variables: none
 * - Properties: none
 * - Methods: `New()`
 *
 * Inherited from `guiListBox`:
 *
 * - Instance variables: `onSelect` (read/write), `onDoubleClick` (read/write)
 * - Properties: `count` (read-only), `selected` (read/write), `value` (read/write),
 *   `selectedText` (read-only)
 * - Methods: `Add()`, `Clear()`, `Item()`
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
 * A combo box is a drop-down list. Its height includes the open list. Add(), Clear() and Item() manage its entries. `onSelect` receives the control when the user selects an entry.
 *
 * The class inherits guiListBox members. `selected` and `value` are the 1-based position; `selectedText` is its text. `onDoubleClick` is not used.
 *
 * $NOTES$
 * guiComboBox is part of the `gui` user library for Windows.
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
 * guiListBox, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Combo box", 360, 170 )
   LOCAL oCombo := guiComboBox():New( oWindow, 30, 35, 300, 120 )

   oCombo:Add( "Small" )
   oCombo:Add( "Large" )
   oCombo:selected := 1
   guiApplication():Run( oWindow )

RETURN

