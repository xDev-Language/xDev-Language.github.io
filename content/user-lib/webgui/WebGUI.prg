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
 * Create a `wg_Window`, add controls to it and call `Run()`. The built-in page lays out controls vertically. Use `wg_Row` for a horizontal group, `wg_Column` for a vertical group and `:grow` to share the remaining space. The window can also open a local HTML file and exchange JSON messages with it.
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
 * wg_Window, wg_Control, wg_Label, wg_Button, wg_Edit, wg_CheckBox, wg_ComboBox, wg_Get, wg_Browse, wg_Menu, wg_Row, wg_Column, wg_Split, wg_Sidebar
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := wg_Window():New( "xDev WebGUI", 480, 300 )
   LOCAL oName := wg_Edit():New( oWindow, "xDev", "Your name" )
   LOCAL oButton := wg_Button():New( oWindow, "Greet" )
   LOCAL oGreeting := wg_Label():New( oWindow, "" )

   oButton:onClick := {|| oGreeting:text := "Hello " + oName:value + "!" }
   oWindow:Run()

RETURN
