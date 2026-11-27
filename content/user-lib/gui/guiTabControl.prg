/*
 * $DOC$
 * $NAME$
 * guiTabControl
 *
 * $ONELINER$
 * Arrange controls on selectable pages
 *
 * $SYNTAX$
 * guiTabControl():New( oWindow, nX, nY, [nWidth], [nHeight] ) --> oTab
 * oTab:AddPage( cTitle ) --> oPage
 * oTab:Page( nPosition ) --> oPage
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
 * Class members declared by `guiTabControl`:
 *
 * - Instance variables: `onSelect` (read/write)
 * - Properties: `count` (read-only), `selected` (read/write), `value` (read/write)
 * - Methods: `New()`, `AddPage()`, `Page()`
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
 * AddPage() appends a tab and returns its guiTabPage. Page() returns a page by its 1-based position. Controls are created with that page as their parent. `onSelect` receives the tab control after a user selection.
 *
 * `count` is the page count. `selected` and `value` are the selected position, or 0 when there are no pages.
 *
 * $NOTES$
 * guiTabControl is part of the `gui` user library for Windows.
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
 * guiTabPage, guiPanel, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Tabs", 460, 260 )
   LOCAL oTab := guiTabControl():New( oWindow, 20, 20, 420, 220 )
   LOCAL oPage := oTab:AddPage( "First" )

   guiLabel():New( oPage, 20, 20, 300, 25, "First page" )
   oTab:AddPage( "Second" )
   guiApplication():Run( oWindow )

RETURN

