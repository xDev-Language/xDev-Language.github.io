/*
 * $DOC$
 * $NAME$
 * guiSidebar
 *
 * $ONELINER$
 * Sidebar with a strip of page pictures and a panel for the shown page
 *
 * $SYNTAX$
 * guiSidebar():New( oWindow ) --> oSidebar
 * oSidebar:AddButton( cBitmap, [cToolTip], [cShortcut], [oMenu] ) --> nPage
 * oSidebar:Panel( nPage ) --> oPanel
 * oSidebar:AddAction( nPage, cBitmap, bAction, [cToolTip] ) --> oSidebar
 * oSidebar:AddGlobal( cBitmap, bAction, [cToolTip] ) --> oSidebar
 * oSidebar:AddSection( nPage, cTitle ) --> oPanel
 * oSidebar:AddItem( nPage, cBitmap, cTitle, [cText], [cInfo], [bAction], [bSettings] ) --> nItem
 * oSidebar:ClearItems( nPage ) --> oSidebar
 * oSidebar:Badge( nPage, nCount ) --> oSidebar
 * guiSidebar() --> oSidebarClass
 *
 * $ARGUMENTS$
 * `oWindow` Window that gets the sidebar at its left edge.
 * `cTitle` Title of a section or a row.
 * `cBitmap` PNG or BMP file, or guiFontIcon, with the picture of a page or a button.
 * `cToolTip` Tip of the picture and the name of a page in the strip menu.
 * `cShortcut` Key that shows the page, written as in guiMenu, e.g. `"Ctrl+Shift+E"`.
 * `oMenu` guiMenu whose items the panel of the page shows.
 * `nPage` Number of a page, counted from 1 in the order of `Add()`.
 * `bAction` Block run on a click. It receives the sidebar.
 * `cText` Text under the title of a row. `cInfo` Line at the bottom of a row.
 * `bSettings` Block of the settings button of a row. It receives the sidebar
 * and the number of the row, as `bAction` of a row does.
 * `nCount` Number shown in the badge of a page. 0 hides the badge.
 *
 * $RETURNS$
 * `New()` returns the sidebar. `AddButton()` returns the number of the new page.
 * `Panel()` and `AddSection()` return a guiPanel. `AddAction()`, `AddGlobal()`,
 * `ClearItems()` and `Badge()` return the sidebar. `AddItem()` returns the
 * number of the row, counted from 1.
 * `guiSidebar()` returns the class object.
 *
 * $DESCRIPTION$
 * Class members declared by `guiSidebar`:
 *
 * - Instance variables: `actions` (internal), `onChange` (read/write), `items` (internal)
 * - Properties: `page` (read/write), `width` (read/write), `barBackground` (read/write),
 *   `accent` (read/write)
 * - Methods: `New()`, `AddButton()`, `Panel()`, `AddAction()`, `AddGlobal()`, `Badge()`,
 *   `AddSection()`, `AddItem()`, `ClearItems()`
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
 * guiSidebar works like the side bar of code editors. At the left there is a
 * narrow strip with one picture for every page. Next to it there is the panel of
 * the shown page: a header with the title and the actions of the page, and under
 * it a guiPanel for the controls of the page.
 *
 * A click on a picture shows its page. A click on the picture of the shown page
 * hides the panel, and the window takes the room. The shown page has a mark at
 * the left edge of its picture. The other pictures are paler until the mouse
 * comes over them.
 *
 * `AddButton()` creates a page. `Panel( nPage )` returns its panel. Controls are
 * created on the panel as on a window. Every panel has the size of the panel
 * area from the start, so the `anchor` of its controls works.
 *
 * With `oMenu` the panel shows the items of the menu one under another, as a
 * list. The row under the mouse is lighter. A click on a command runs it as a
 * command of the menu bar. A click on a drop-down menu opens it at the right of
 * its row. Separators are thin lines. Pictures, shortcuts and `bWhen` of the
 * menu work as in guiMenu.
 *
 * `AddAction()` puts a small button at the right of the header of a page. It
 * is visible only with its page. `AddGlobal()` puts a button at the bottom of
 * the strip, e.g. for the settings. `Badge()` shows a count on a page picture.
 *
 * `AddSection()` adds a panel under a header with an arrow. A click on the
 * header opens or closes the section. Open sections share the page height.
 *
 * `AddItem()` adds a row to the list of a page, as in a list of extensions:
 * the picture at the left, the title in bold, `cText` under it and `cInfo` at
 * the bottom. The row under the mouse is lighter, the row clicked last stays
 * marked. With `bSettings` the row has a settings button at the right of
 * `cInfo`. The list scrolls when it does not fit the panel. `ClearItems()`
 * removes every row of a page, e.g. before the list is filled again.
 *
 * The mouse changes the width of the panel by dragging its right edge. The
 * sidebar reaches at most half of the window. Dragged below the smallest width,
 * the panel hides when the mouse lets go and keeps its width from before. The
 * sidebar stands between the bars at the top and at the bottom of the window.
 * A guiPanel that fills the window makes room for it.
 *
 * Members:
 * `page` Number of the shown page, 0 when the panel is hidden. Assigning 0
 * hides the panel.
 * `width` Width of the panel in logical pixels, without the strip. It is 260
 * at the start and at least 170.
 * `onChange` Block run after a click on the strip. It receives the sidebar and
 * the number of the shown page.
 * `background`, `foreground` Colors of the panel and of the title, as in
 * guiWindow.
 * `barBackground` Color of the strip (0xRRGGBB). NIL gives 0x181818. The
 * strip has a line of one pixel at its right edge.
 * `accent` Color of the mark of the shown page. NIL gives the selection color
 * of the system.
 *
 * $NOTES$
 * The first picture sets the size of all pictures of its bar. Pictures of
 * 24 x 24 pixels suit the strip, 16 x 16 pixels suit the actions. A PNG picture
 * keeps its transparency.
 *
 * A guiToolbar at the side `"Left"` does not go together with a sidebar.
 *
 * Assigning `page` does not run `onChange`. `guiSidebar` is part of the
 * `gui` user library.
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
 * guiWindow, guiPanel, guiToolbar, guiTreeView
 *
 * $DOCEND$
 */

// The pictures files.png, options.png, refresh.png and settings.png lie next to the program
PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Sidebar example", 900, 600 )
   LOCAL oSide := guiSidebar():New( oWindow )
   LOCAL oEditor := guiPanel():New( oWindow )
   LOCAL oMemo := guiMemo():New( oEditor, 0, 0, oEditor:width, oEditor:height, "" )
   LOCAL nFiles, oPanel, oTree, oMenu, oBackup

   oMemo:anchor := "LTRB"

   nFiles := oSide:AddButton( "files.png", "Explorer", "Ctrl+Shift+E" )
   oPanel := oSide:Panel( nFiles )
   oTree := guiTreeView():New( oPanel, 0, 0, oPanel:width, oPanel:height )
   oTree:anchor := "LTRB"
   oTree:Add( "src" )
   oTree:Add( "README.md" )
   oSide:AddAction( nFiles, "refresh.png", {|| oTree:Clear() }, "Refresh" )

   oMenu := guiMenu():New( .T. )
   oMenu:Add( "Settings", {|| guiMsgInfo( "Settings" ) } )
   oMenu:AddSeparator()
   oBackup := oMenu:AddMenu( "Data backup" )
   oBackup:Add( "Make a backup", {|| guiMsgInfo( "Backup" ) } )
   oSide:AddButton( "options.png", "Options", "Ctrl+Shift+O", oMenu )

   oSide:AddGlobal( "settings.png", {|| guiMsgInfo( "Settings" ) }, "Settings" )
   oSide:onChange := {| o, nPage | oWindow:title := "Page " + LTrim( Str( nPage ) ) }
   oSide:page := nFiles

   guiApplication():Run( oWindow )

RETURN
