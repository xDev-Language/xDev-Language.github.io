/*
 * $DOC$
 * $NAME$
 * guiWindow
 *
 * $ONELINER$
 * Create and control a top-level window
 *
 * $SYNTAX$
 * guiWindow():New( [cTitle], [nWidth], [nHeight] ) --> oWindow
 * oWindow:Show() --> oWindow
 * oWindow:Hide() --> oWindow
 * oWindow:Close() --> NIL
 * oWindow:Center() --> oWindow
 * oWindow:SetIcon( cFile ) --> oWindow
 * oWindow:SetKey( cKey, [bAction] ) --> bPrevious
 * oWindow:FocusNext( [lPrevious] ) --> oWindow
 * oWindow:ReadModal( [GetList], [nGet] ) --> lSaved
 * oWindow:EndRead( [lSave] ) --> oWindow
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
 * Class members declared by `guiWindow`:
 *
 * - Instance variables: `handle` (read-only), `menuBar` (internal), `popupMenu` (internal),
 *   `keyBlocks` (internal)
 * - Properties: `menu` (read/write), `contextMenu` (read/write), `title` (read/write), `sizable`
 *   (read/write), `width` (read/write), `height` (read/write), `background` (read/write),
 *   `foreground` (read/write)
 * - Methods: `New()`, `SetKey()`, `FocusNext()`, `ReadModal()`, `EndRead()`, `Show()`, `Hide()`,
 *   `Close()`, `Center()`, `SetIcon()`, `OnClose()`, `OnResize()`, `OnKey()`, `OnMenu()`
 *
 * The constructor creates a hidden window whose client area is measured in logical pixels. Show() displays it; guiApplication():Run() also displays the main window. Close() destroys the window and its controls. Center() places it over its owner or in the screen centre. ReadModal() runs entry through the window's edit controls. Enter moves to the next field, while Escape cancels the entry. OnClose(), OnResize(), OnKey() and OnMenu() are methods intended for overriding in a subclass.
 *
 * Properties: `title`, `menu`, `contextMenu`, `sizable`, `width`, `height`, `background` and `foreground`. `foreground` is the text color of labels, group boxes, check boxes and radio buttons that have no own `color`. A control with a `name` can also be read as a message of the window, for example `oWindow:customer`.
 *
 * $NOTES$
 * guiWindow is part of the `gui` user library for Windows.
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
 * GUI, guiApplication, guiDialog, guiPanel
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Window", 420, 180 )

   guiLabel():New( oWindow, 20, 25, 360, 30, "Main window" )
   guiApplication():Run( oWindow )

RETURN

