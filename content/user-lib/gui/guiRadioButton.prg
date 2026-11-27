/*
 * $DOC$
 * $NAME$
 * guiRadioButton
 *
 * $ONELINER$
 * Select one option from a group
 *
 * $SYNTAX$
 * guiRadioButton():New( oWindow, nX, nY, [nWidth], [nHeight], [cText] ) --> oRadioButton
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
 * Class members declared by `guiRadioButton`:
 *
 * - Instance variables: none
 * - Properties: none
 * - Methods: `New()`
 *
 * Inherited from `guiCheckBox`:
 *
 * - Instance variables: `onChange` (read/write)
 * - Properties: `checked` (read/write), `value` (read/write), `color` (read/write)
 * - Methods: none
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
 * Radio buttons created one after another form a group. Checking one unchecks the other buttons in that group. `checked` and `value` contain the logical state, and `onChange` receives the control.
 *
 * The class inherits guiCheckBox and guiControl members.
 *
 * $NOTES$
 * guiRadioButton is part of the `gui` user library for Windows.
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
 * guiCheckBox, guiGroupBox, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Choice", 360, 180 )
   LOCAL oFirst := guiRadioButton():New( oWindow, 30, 40, 260, 22, "First" )

   guiRadioButton():New( oWindow, 30, 75, 260, 22, "Second" )
   oFirst:checked := .T.
   guiApplication():Run( oWindow )

RETURN

