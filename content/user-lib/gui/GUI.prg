/*
 * $DOC$
 * $NAME$
 * GUI
 *
 * $ONELINER$
 * Create a native graphical application for Windows
 *
 * $SYNTAX$
 * oWindow := guiWindow():New( [cTitle], [nWidth], [nHeight] )
 * guiApplication():Run( oWindow ) --> .T.
 *
 * $ARGUMENTS$
 * `cTitle` Title of the main window. The default is an empty title.
 * `nWidth` Width of its client area in logical pixels. The default is 640.
 * `nHeight` Height of its client area in logical pixels. The default is 480.
 * `oWindow` Main window of the application.
 *
 * $RETURNS$
 * `guiWindow():New()` returns a hidden window. `Run()` shows it, processes
 * its events and returns `.T.` after it closes.
 *
 * $DESCRIPTION$
 * The `gui` user library creates windows, menus and controls as xDev objects.
 * Create the main window first, add its controls, and pass it to
 * `guiApplication():Run()`. `Run()` shows the window and waits until it is
 * closed. A program that uses this library is built with the `--windows`
 * option.
 *
 * Positions and sizes use logical pixels. The library scales them for the
 * monitor. Text is UTF-8. Colors are numbers written as `0xRRGGBB`; NIL uses
 * the system color. A PNG picture keeps its transparency.
 *
 * Every control receives its parent as the first argument of `New()`. The
 * parent is a guiWindow, guiDialog, guiPanel or guiTabPage. The usual next
 * arguments are `nX`, `nY`, `nWidth` and `nHeight`. Assign `anchor` with a
 * combination of `"L"`, `"T"`, `"R"` and `"B"` to attach its edges to the
 * edges of the parent. Opposite edges make the control grow with the parent.
 *
 * Common control members are `handle`, `parent`, `name`, `focused`, `font`,
 * `text`, `value`, `x`, `y`, `width`, `height`, `toolTip`, `contextMenu`,
 * `visible`, `enabled` and `anchor`. `SetFocus()` moves keyboard focus to a
 * control and `Destroy()` removes it. Every class page lists all members
 * declared by that class and all public members inherited from its parents.
 *
 * Event members contain code blocks. For example, `onClick` receives the
 * control that was clicked. Window events are methods that may be overridden
 * in a subclass: `OnClose()`, `OnResize( nWidth, nHeight )`,
 * `OnKey( nKey )` and `OnMenu( nId )`. `OnClose()` returns `.F.` to keep the
 * window open.
 *
 * Windows and containers:
 * `guiWindow` creates a top-level window. `guiDialog` creates a modal or
 * modeless owned window. `guiPanel` groups one part of a window. `guiTabControl`
 * contains guiTabPage pages. `guiSidebar` adds a strip of page pictures and a
 * panel for the selected page.
 *
 * Text and input controls:
 * `guiLabel` shows text, `guiSay` shows a formatted value, `guiEdit` edits one
 * line, `guiGet` edits a value through a picture, and `guiMemo` edits several
 * lines. `guiButton`, `guiCheckBox`, `guiRadioButton` and `guiGroupBox` provide
 * the usual form controls. `ReadModal()` on a window or dialog runs form entry
 * and returns whether the values were accepted.
 *
 * Selection and data controls:
 * `guiListBox` and `guiComboBox` select text items. `guiDatePicker` selects a
 * date. `guiSlider` selects a number. `guiListView` shows rows and columns,
 * `guiTreeView` shows a hierarchy, and `guiBrowse` browses records and columns.
 * `guiProgressBar` shows progress.
 *
 * Commands and information:
 * `guiMenu` builds a menu bar or a popup menu. `guiToolbar` adds command
 * buttons. `guiStatusBar` shows text at the bottom of a window. `guiTimer`
 * runs a block at an interval. `guiFont` describes a control font and
 * `guiFontIcon` creates a small monochrome picture from an icon font.
 *
 * Dialog functions:
 * `guiMsgInfo()`, `guiMsgWarning()` and `guiMsgError()` show a message.
 * `guiMsgYesNo()` asks a question. `guiFileOpenDialog()` and
 * `guiFileSaveDialog()` select a path. `guiOpenFile()` opens a file in the
 * program assigned to its type by the system.
 *
 * $NOTES$
 * The library is available on Windows. The main window is hidden until
 * `guiApplication():Run()` or `Show()` is called. Controls are destroyed with
 * their parent.
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
 * guiWindow, guiControl, guiFont, guiSidebar
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "GUI example", 480, 220 )
   LOCAL oLabel := guiLabel():New( oWindow, 30, 35, 420, 30, "Hello from xDev" )
   LOCAL oButton := guiButton():New( oWindow, 165, 110, 150, 36, "Close" )

   oLabel:anchor := "LTR"
   oButton:onClick := {|| oWindow:Close() }

   guiApplication():Run( oWindow )

RETURN
