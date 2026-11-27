/*
 * $DOC$
 * $NAME$
 * guiToolbar
 *
 * $ONELINER$
 * Add a bar of command buttons to a window
 *
 * $SYNTAX$
 * guiToolbar():New( oWindow, [cSide] ) --> oToolbar
 * oToolbar:Add( cText, [cBitmap], [bAction], [cToolTip], [cShortcut] ) --> nButton
 * oToolbar:AddMenu( cText, oMenu, [cBitmap], [cToolTip], [cShortcut] ) --> nButton
 * oToolbar:AddSeparator() --> oToolbar
 * oToolbar:Clear() --> oToolbar
 * oToolbar:Enable( nButton, lEnable ) --> oToolbar
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
 * Class members declared by `guiToolbar`:
 *
 * - Instance variables: `actions` (internal)
 * - Properties: `foreground` (read/write), `background` (read/write), `hoverForeground`
 *   (read/write), `hoverBackground` (read/write), `pressForeground` (read/write),
 *   `pressBackground` (read/write)
 * - Methods: `New()`, `Add()`, `AddMenu()`, `AddSeparator()`, `Clear()`, `Enable()`
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
 * A toolbar may be placed at `Top`, `Bottom`, `Left` or `Right`. Add() returns a 1-based button number and runs its action with the toolbar. AddMenu() creates a button that opens a popup menu. Shortcuts use the same notation as guiMenu.
 *
 * Colors are `foreground`, `background`, `hoverForeground`, `hoverBackground`, `pressForeground` and `pressBackground`. NIL restores a system color.
 *
 * $NOTES$
 * guiToolbar is part of the `gui` user library for Windows.
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
 * guiMenu, guiWindow, guiStatusBar
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Toolbar", 480, 220 )
   LOCAL oToolbar := guiToolbar():New( oWindow )

   oToolbar:Add( "Close", NIL, {|| oWindow:Close() }, "Close window", "Alt+F4" )
   guiApplication():Run( oWindow )

RETURN

