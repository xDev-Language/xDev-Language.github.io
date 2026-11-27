/*
 * $DOC$
 * $NAME$
 * guiSlider
 *
 * $ONELINER$
 * Select a numeric value with a slider
 *
 * $SYNTAX$
 * guiSlider():New( oWindow, nX, nY, [nWidth], [nHeight] ) --> oSlider
 * oSlider:value --> nValue
 * oSlider:value := nValue
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
 * Class members declared by `guiSlider`:
 *
 * - Instance variables: `onChange` (read/write)
 * - Properties: `value` (read/write), `minimum` (read/write), `maximum` (read/write)
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
 * The horizontal slider starts with the range 0 to 100. `onChange` runs while the user moves it and receives the control.
 *
 * `minimum` and `maximum` set the range. `value` is the current position and must stay within that range.
 *
 * $NOTES$
 * guiSlider is part of the `gui` user library for Windows.
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
 * guiProgressBar, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Slider", 420, 160 )
   LOCAL oSlider := guiSlider():New( oWindow, 30, 55, 360, 30 )

   oSlider:maximum := 10
   oSlider:value := 5
   guiApplication():Run( oWindow )

RETURN

