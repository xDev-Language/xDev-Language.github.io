/*
 * $DOC$
 * $NAME$
 * gui_Sidebar
 *
 * $ONELINER$
 * Sidebar with a strip of page pictures and a panel for the shown page
 *
 * $SYNTAX$
 * gui_Sidebar():New( oWindow ) --> oSidebar
 * oSidebar:Add( cTitle, cBitmap, [cToolTip], [cShortcut] ) --> nPage
 * oSidebar:Panel( nPage ) --> oPanel
 * oSidebar:AddAction( nPage, cBitmap, bAction, [cToolTip] ) --> oSidebar
 * oSidebar:AddButton( cBitmap, bAction, [cToolTip] ) --> oSidebar
 * gui_Sidebar() --> oSidebarClass
 *
 * $ARGUMENTS$
 * `oWindow` Window that gets the sidebar at its left edge.
 * `cTitle` Title of the page, shown in the header of its panel.
 * `cBitmap` PNG or BMP file with the picture of a page or a button.
 * `cToolTip` Tip of the picture. Without it the tip of a page is `cTitle`.
 * `cShortcut` Key that shows the page, written as in gui_Menu, e.g. `"Ctrl+Shift+E"`.
 * `nPage` Number of a page, counted from 1 in the order of `Add()`.
 * `bAction` Block run on a click. It receives the sidebar.
 *
 * $RETURNS$
 * `New()` returns the sidebar. `Add()` returns the number of the new page.
 * `Panel()` returns the gui_Panel of the page. `AddAction()` and `AddButton()`
 * return the sidebar. `gui_Sidebar()` returns the class object.
 *
 * $DESCRIPTION$
 * gui_Sidebar works like the side bar of code editors. At the left there is a
 * narrow strip with one picture for every page. Next to it there is the panel of
 * the shown page: a header with the title and the actions of the page, and under
 * it a gui_Panel for the controls of the page.
 *
 * A click on a picture shows its page. A click on the picture of the shown page
 * hides the panel, and the window takes the room. The shown page has a mark at
 * the left edge of its picture. The other pictures are paler until the mouse
 * comes over them.
 *
 * `Add()` creates a page. `Panel( nPage )` returns its panel. Controls are
 * created on the panel as on a window. Every panel has the size of the panel
 * area from the start, so the `anchor` of its controls works.
 *
 * `AddAction()` puts a small button at the right of the header of a page. It
 * is visible only with its page. `AddButton()` puts a button at the bottom of
 * the strip, e.g. for the settings.
 *
 * The mouse changes the width of the panel by dragging its right edge. The
 * sidebar stands between the bars at the top and at the bottom of the window.
 * A gui_Panel that fills the window makes room for it.
 *
 * Members:
 * `page` Number of the shown page, 0 when the panel is hidden. Assigning 0
 * hides the panel.
 * `width` Width of the panel in logical pixels, without the strip. It is 260
 * at the start and at least 170.
 * `onChange` Block run after a click on the strip. It receives the sidebar and
 * the number of the shown page.
 * `background`, `foreground` Colors of the panel and of the title, as in
 * gui_Window.
 * `barBackground` Color of the strip (0xRRGGBB). NIL gives the color of the
 * panel a shade towards the text.
 * `accent` Color of the mark of the shown page. NIL gives the selection color
 * of the system.
 *
 * $NOTES$
 * The first picture sets the size of all pictures of its bar. Pictures of
 * 24 x 24 pixels suit the strip, 16 x 16 pixels suit the actions. A PNG picture
 * keeps its transparency.
 *
 * A gui_Toolbar at the side `"Left"` does not go together with a sidebar.
 *
 * Assigning `page` does not run `onChange`. `gui_Sidebar` is part of the
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
 * gui_Window, gui_Panel, gui_Toolbar, gui_TreeView
 *
 * $DOCEND$
 */

// The pictures files.png, search.png, refresh.png and settings.png lie next to the program
PROCEDURE Main()

   LOCAL oWindow := gui_Window():New( "Sidebar example", 900, 600 )
   LOCAL oSide := gui_Sidebar():New( oWindow )
   LOCAL oEditor := gui_Panel():New( oWindow )
   LOCAL oMemo := gui_Memo():New( oEditor, 0, 0, oEditor:width, oEditor:height, "" )
   LOCAL nFiles, nSearch, oPanel, oTree, oFind

   oMemo:anchor := "LTRB"

   nFiles := oSide:Add( "EXPLORER", "files.png", "Explorer", "Ctrl+Shift+E" )
   oPanel := oSide:Panel( nFiles )
   oTree := gui_TreeView():New( oPanel, 0, 0, oPanel:width, oPanel:height )
   oTree:anchor := "LTRB"
   oTree:Add( "src" )
   oTree:Add( "README.md" )
   oSide:AddAction( nFiles, "refresh.png", {|| oTree:Clear() }, "Refresh" )

   nSearch := oSide:Add( "SEARCH", "search.png", "Search", "Ctrl+Shift+F" )
   oPanel := oSide:Panel( nSearch )
   oFind := gui_Edit():New( oPanel, 12, 8, oPanel:width - 24, 24, "" )
   oFind:anchor := "LTR"

   oSide:AddButton( "settings.png", {|| gui_MsgInfo( "Settings" ) }, "Settings" )
   oSide:onChange := {| o, nPage | oWindow:title := "Page " + LTrim( Str( nPage ) ) }
   oSide:page := nFiles

   gui_Application():Run( oWindow )

RETURN
