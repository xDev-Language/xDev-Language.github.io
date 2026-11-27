/*
 * $DOC$
 * $NAME$
 * guiTabPage
 *
 * $ONELINER$
 * Contain controls on one page of a tab control
 *
 * $SYNTAX$
 * oTab:AddPage( cTitle ) --> oPage
 * guiTabPage():New() --> NIL
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
 * Class members declared by `guiTabPage`:
 *
 * - Instance variables: none
 * - Properties: none
 * - Methods: `New()`
 *
 * Inherited from `guiWindow`:
 *
 * - Instance variables: `handle` (read-only)
 * - Properties: `menu` (read/write), `contextMenu` (read/write), `title` (read/write), `sizable`
 *   (read/write), `width` (read/write), `height` (read/write), `background` (read/write),
 *   `foreground` (read/write)
 * - Methods: `SetKey()`, `FocusNext()`, `ReadModal()`, `EndRead()`, `Show()`, `Hide()`,
 *   `Close()`, `Center()`, `SetIcon()`, `OnClose()`, `OnResize()`, `OnKey()`, `OnMenu()`
 *
 * Pages are created only by guiTabControl:AddPage(), not directly by New(). A page follows the size of its tab control. Create controls on the returned page in the same way as on a window or panel.
 *
 * The page inherits guiWindow members used by a child container, including colors, key handling, focus order and named-control lookup.
 *
 * $NOTES$
 * guiTabPage is part of the `gui` user library for Windows.
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
 * guiTabControl, guiPanel, guiWindow
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Tab page", 460, 260 )
   LOCAL oTab := guiTabControl():New( oWindow, 20, 20, 420, 220 )
   LOCAL oPage := oTab:AddPage( "General" )

   guiLabel():New( oPage, 20, 20, 300, 25, "Control on a page" )
   guiApplication():Run( oWindow )

RETURN

