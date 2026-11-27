/*
 * $DOC$
 * $NAME$
 * guiProgressBar
 *
 * $ONELINER$
 * Show the progress of an operation
 *
 * $SYNTAX$
 * guiProgressBar():New( oWindow, nX, nY, [nWidth], [nHeight] ) --> oProgress
 * oProgress:value --> nValue
 * oProgress:value := nValue
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
 * Class members declared by `guiProgressBar`:
 *
 * - Instance variables: none
 * - Properties: `value` (read/write), `maximum` (read/write)
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
 * The progress bar starts with the range 0 to 100. Assign `value` to move it between zero and the maximum.
 *
 * `maximum` is the highest position. The minimum is always 0. The class inherits guiControl geometry and visibility members.
 *
 * $NOTES$
 * guiProgressBar is part of the `gui` user library for Windows.
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
 * guiSlider, guiStatusBar, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Progress", 420, 150 )
   LOCAL oProgress := guiProgressBar():New( oWindow, 30, 55, 360, 22 )

   oProgress:maximum := 200
   oProgress:value := 80
   guiApplication():Run( oWindow )

RETURN

