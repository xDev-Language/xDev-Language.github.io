/*
 * $DOC$
 * $NAME$
 * guiLabel
 *
 * $ONELINER$
 * Show a line of text in a window
 *
 * $SYNTAX$
 * guiLabel():New( oWindow, nX, nY, [nWidth], [nHeight], [cText] ) --> oLabel
 * oLabel:AddLineAfter( [nColor] ) --> oLabel
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
 * Class members declared by `guiLabel`:
 *
 * - Instance variables: none
 * - Properties: `border` (read/write), `align` (read/write), `color` (read/write)
 * - Methods: `New()`, `AddLineAfter()`
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
 * A label shows text that the user does not edit. The default size is 200 by 20 logical pixels. AddLineAfter() draws a horizontal line after the text, using the supplied color or the system color.
 *
 * `border` shows a border. `align` is 0 for left, 1 for right and 2 for centred text. `color` is the text color 0xRRGGBB; NIL gives the label the color of its window, `foreground`. The class inherits the guiControl members.
 *
 * $NOTES$
 * guiLabel is part of the `gui` user library for Windows.
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
 * guiControl, guiSay, guiFont
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Label", 420, 160 )
   LOCAL oLabel := guiLabel():New( oWindow, 20, 30, 380, 30, "Section" )

   oLabel:AddLineAfter()
   guiApplication():Run( oWindow )

RETURN

