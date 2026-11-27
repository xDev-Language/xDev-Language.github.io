/*
 * $DOC$
 * $NAME$
 * guiMenu
 *
 * $ONELINER$
 * Build a menu bar or context menu
 *
 * $SYNTAX$
 * guiMenu():New( [lPopup] ) --> oMenu
 * oMenu:AddMenu( cText, [cBitmap] ) --> oSubmenu
 * oMenu:Add( cText, [bAction], [cShortcut], [cBitmap], [bWhen] ) --> nId
 * oMenu:AddSeparator() --> oMenu
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
 * Class members declared by `guiMenu`:
 *
 * - Instance variables: `handle` (read-only)
 * - Properties: none
 * - Methods: `New()`, `AddMenu()`, `Add()`, `AddSeparator()`
 *
 * Without `lPopup`, the object is a menu bar. With `.T.` it is a context menu. AddMenu() appends a drop-down menu. Add() appends a command and returns its identifier. Its action receives the window. `bWhen` is evaluated before the command runs and whenever its menu opens; a false value disables the command.
 *
 * Shortcuts use names such as `Ctrl+S`, `Shift+F5`, `Del` and `Esc`. A menu bar is assigned to `oWindow:menu`; a popup menu is assigned to `contextMenu`.
 *
 * $NOTES$
 * guiMenu is part of the `gui` user library for Windows.
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
 * guiWindow, guiToolbar, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Menu", 420, 180 )
   LOCAL oMenu := guiMenu():New()
   LOCAL oFile := oMenu:AddMenu( "&File" )

   oFile:Add( "E&xit", {|| oWindow:Close() }, "Alt+F4" )
   oWindow:menu := oMenu
   guiApplication():Run( oWindow )

RETURN

