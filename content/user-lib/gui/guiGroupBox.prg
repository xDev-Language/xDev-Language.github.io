/*
 * $DOC$
 * $NAME$
 * guiGroupBox
 *
 * $ONELINER$
 * Draw a captioned frame around controls
 *
 * $SYNTAX$
 * guiGroupBox():New( oWindow, nX, nY, [nWidth], [nHeight], [cText] ) --> oGroupBox
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
 * Class members declared by `guiGroupBox`:
 *
 * - Instance variables: none
 * - Properties: `color` (read/write)
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
 * A group box is a visual frame with a caption. Create the controls it surrounds with the same window or panel as their parent. The default size is 200 by 100 logical pixels.
 *
 * The caption is the `text` property. `color` is the caption color 0xRRGGBB; NIL gives it the color of its window, `foreground`. The class inherits guiControl members.
 *
 * $NOTES$
 * guiGroupBox is part of the `gui` user library for Windows.
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
 * guiCheckBox, guiRadioButton, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Group", 400, 200 )

   guiGroupBox():New( oWindow, 20, 20, 360, 140, "Options" )
   guiCheckBox():New( oWindow, 45, 65, 280, 22, "Enabled" )
   guiApplication():Run( oWindow )

RETURN

