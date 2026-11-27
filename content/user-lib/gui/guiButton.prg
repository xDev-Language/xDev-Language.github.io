/*
 * $DOC$
 * $NAME$
 * guiButton
 *
 * $ONELINER$
 * Run an action from a push button
 *
 * $SYNTAX$
 * guiButton():New( oWindow, nX, nY, [nWidth], [nHeight], [cText] ) --> oButton
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
 * Class members declared by `guiButton`:
 *
 * - Instance variables: `onClick` (read/write)
 * - Properties: `isDefault` (read/write), `isCancel` (read/write)
 * - Methods: `New()`
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
 * `onClick` is run when the user activates the button and receives the button object. The default size is 90 by 25 logical pixels.
 *
 * `isDefault` makes Enter activate the button. `isCancel` makes Escape activate it. The class inherits guiControl members.
 *
 * $NOTES$
 * guiButton is part of the `gui` user library for Windows.
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
 * guiControl, guiDialog, guiWindow
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Button", 360, 150 )
   LOCAL oButton := guiButton():New( oWindow, 125, 60, 110, 28, "Close" )

   oButton:isDefault := .T.
   oButton:onClick := {|| oWindow:Close() }
   guiApplication():Run( oWindow )

RETURN

