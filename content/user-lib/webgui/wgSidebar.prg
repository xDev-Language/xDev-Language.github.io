/*
 * $DOC$
 * $NAME$
 * wgSidebar
 *
 * $ONELINER$
 * Add an icon strip and a page panel to a window
 *
 * $SYNTAX$
 * wgSidebar():New( oWindow, [nWidth] ) --> oSidebar
 * oSidebar:Add( cTitle, cPicture, [cToolTip] ) --> nPage
 * oSidebar:Panel( nPage ) --> oPanel
 * oSidebar:AddAction( nPage, cPicture, bAction, [cToolTip] ) --> oSidebar
 * oSidebar:AddButton( cPicture, bAction, [cToolTip] ) --> oSidebar
 * oSidebar:onChange := {| oSidebar | ... }
 *
 * $ARGUMENTS$
 * `oWindow` Window that owns the sidebar.
 * `nWidth` Initial width of the page panel in logical pixels. The default is 260.
 * `cTitle` Title shown in the page header.
 * `cPicture` PNG, SVG, JPEG, GIF or BMP icon. The library looks up an embedded resource by filename or stem, then tries the file.
 * `cToolTip` Optional tooltip. For a page icon the default is `cTitle`.
 * `nPage` One-based page number returned by `Add()`.
 * `bAction` Block that receives the sidebar when the button is clicked.
 *
 * $RETURNS$
 * `New()` returns the sidebar, `Add()` returns the new page number, and `Panel()` returns its `wgPanel`. `AddAction()` and `AddButton()` return the sidebar.
 *
 * $DESCRIPTION$
 * The icon strip sits at the left edge of the window. Add pages and place controls in the containers returned by `Panel()`. `AddAction()` puts a button in one page's header. `AddButton()` puts a button at the bottom of the strip, where it is available with any page.
 *
 * `:value` is the number of the visible page. It starts at 0 with the panel hidden. Clicking an icon opens its page, and clicking the same icon again hides the panel. Both actions run `onChange`. Assign `:value` to select a page from xDev or assign 0 to hide it.
 *
 * The strip remains visible when the page panel is hidden. The user can drag the right edge of the panel. Assign `:width` to set the panel width from xDev.
 *
 * $NOTES$
 * See `webgui-sidebar.prg` in Examples for a sidebar next to a split.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wgWindow, wgControl, wgPanel, wgSplit
 *
 * $DOCEND$
 */
