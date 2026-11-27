/*
 * $DOC$
 * $NAME$
 * guiPanel
 *
 * $ONELINER$
 * Group controls in one part of a window
 *
 * $SYNTAX$
 * guiPanel():New( oWindow, [nX], [nY], [nWidth], [nHeight] ) --> oPanel
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
 * Class members declared by `guiPanel`:
 *
 * - Instance variables: none
 * - Properties: `anchor` (read/write)
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
 * A panel is a child window used as the parent of controls. Without an explicit size it fills the space between the bars of its window and follows changes of the window size. Closing the panel also closes all controls placed on it.
 *
 * `anchor` attaches the panel to the L, T, R and B edges. The panel inherits window colors, key handling, focus order and named-control lookup from guiWindow.
 *
 * $NOTES$
 * guiPanel is part of the `gui` user library for Windows.
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
 * guiWindow, guiControl, guiTabPage, guiSidebar
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Panel", 420, 220 )
   LOCAL oPanel := guiPanel():New( oWindow, 20, 20, 380, 160 )

   guiLabel():New( oPanel, 15, 15, 300, 25, "Control on a panel" )
   oPanel:anchor := "LTRB"
   guiApplication():Run( oWindow )

RETURN

