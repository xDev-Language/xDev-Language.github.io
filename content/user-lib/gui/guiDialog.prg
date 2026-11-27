/*
 * $DOC$
 * $NAME$
 * guiDialog
 *
 * $ONELINER$
 * Show an owned dialog window
 *
 * $SYNTAX$
 * guiDialog():New( [oOwner], [cTitle], [nWidth], [nHeight] ) --> oDialog
 * oDialog:ShowModal() --> nResult
 * oDialog:EndDialog( nResult ) --> NIL
 * oDialog:result --> nResult
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
 * Class members declared by `guiDialog`:
 *
 * - Instance variables: `dialogResult` (internal)
 * - Properties: `result` (read-only)
 * - Methods: `New()`, `ShowModal()`, `EndDialog()`
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
 * A dialog is an owned window. ShowModal() shows it, disables its owner and waits until EndDialog() or Close() ends it. EndDialog() stores and returns the numeric result. A dialog can instead be shown modelessly with Show().
 *
 * The class inherits the window properties and methods. `result` is the result supplied to EndDialog(), or 0 before the dialog ends.
 *
 * $NOTES$
 * guiDialog is part of the `gui` user library for Windows.
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
 * guiWindow, guiButton, guiApplication
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oDialog := guiDialog():New( NIL, "Question", 320, 140 )
   LOCAL oButton := guiButton():New( oDialog, 110, 70, 100, 28, "OK" )

   oButton:isDefault := .T.
   oButton:onClick := {|| oDialog:EndDialog( 1 ) }
   oDialog:ShowModal()

RETURN

