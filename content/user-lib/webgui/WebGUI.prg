/*
 * $DOC$
 * $NAME$
 * WebGUI
 *
 * $ONELINER$
 * Windows desktop interfaces rendered by WebView2
 *
 * $DESCRIPTION$
 * WebGUI creates Windows desktop interfaces with xDev objects. WebView2 renders the controls in HTML, and the xDev program keeps their values and handles events in code blocks. Text is passed as UTF-8.
 *
 * Create a `wgWindow`, add controls to it and call `Run()`. The built-in page lays out controls vertically. Use `wgRow` for a horizontal group, `wgColumn` for a vertical group and `:grow` to share the remaining space. The window can also open a local HTML file and exchange JSON messages with it.
 *
 * WebGUI requires Windows, the Microsoft Edge WebView2 Runtime and `WebView2Loader.dll` on the DLL search path. In MSYS2 CLANG64 the loader comes from `mingw-w64-clang-x86_64-webview2-loader`.
 *
 * Run `make` in the xDev source tree to build `libxwebgui.a` with the other libraries. `make install` installs xDev and the libraries. xDev links user libraries in `lib/xdev` automatically. Build a desktop program without a console with `xdev --windows WebGUI.prg`.
 *
 * $NOTES$
 * The Examples section includes `webgui.prg` for basic controls and separate programs for browse, GET, menu and sidebar. WebGUI is in development and its classes and arguments may change.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wgWindow, wgControl, wgLabel, wgButton, wgEdit, wgCheckBox, wgComboBox, wgGet, wgBrowse, wgMenu, wgRow, wgColumn, wgSplit, wgSidebar
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := wgWindow():New( "xDev WebGUI", 480, 300 )
   LOCAL oName := wgEdit():New( oWindow, "xDev", "Your name" )
   LOCAL oButton := wgButton():New( oWindow, "Greet" )
   LOCAL oGreeting := wgLabel():New( oWindow, "" )

   oButton:onClick := {|| oGreeting:text := "Hello " + oName:value + "!" }
   oWindow:Run()

RETURN
