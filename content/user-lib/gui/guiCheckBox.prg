/*
 * $DOC$
 * $NAME$
 * guiCheckBox
 *
 * $ONELINER$
 * Select an independent logical option
 *
 * $SYNTAX$
 * guiCheckBox():New( oWindow, nX, nY, [nWidth], [nHeight], [cText] ) --> oCheckBox
 * oCheckBox:checked --> lChecked
 * oCheckBox:checked := lChecked
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
 * Class members declared by `guiCheckBox`:
 *
 * - Instance variables: `onChange` (read/write)
 * - Properties: `checked` (read/write), `value` (read/write), `color` (read/write)
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
 * The control displays a check box and caption. `checked` and `value` contain its logical state. `onChange` runs when the user changes the state and receives the control. `color` is the text color 0xRRGGBB; NIL gives the control the color of its window, `foreground`.
 *
 * The default size is 200 by 20 logical pixels. The class inherits guiControl members.
 *
 * $NOTES$
 * guiCheckBox is part of the `gui` user library for Windows.
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
 * guiRadioButton, guiGroupBox, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Check box", 360, 150 )
   LOCAL oCheck := guiCheckBox():New( oWindow, 30, 45, 280, 25, "Show details" )

   oCheck:checked := .T.
   guiApplication():Run( oWindow )

RETURN

