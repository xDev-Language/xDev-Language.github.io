/*
 * $DOC$
 * $NAME$
 * guiSay
 *
 * $ONELINER$
 * Show a fixed-width SAY field
 *
 * $SYNTAX$
 * guiSay():New( oWindow, nX, nY, [nLen], [nHeight], [cText] ) --> oSay
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
 * Class members declared by `guiSay`:
 *
 * - Instance variables: none
 * - Properties: none
 * - Methods: `New()`
 *
 * Inherited from `guiLabel`:
 *
 * - Instance variables: none
 * - Properties: `border` (read/write), `align` (read/write), `color` (read/write)
 * - Methods: `AddLineAfter()`
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
 * guiSay creates a fixed-font label whose width is given as a number of characters. It is useful next to guiGet fields and follows the same 9 by 18 logical-pixel grid.
 *
 * The class inherits label members, including `text`, `border`, `align`, colors and font.
 *
 * $NOTES$
 * guiSay is part of the `gui` user library for Windows.
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
 * guiLabel, guiGet, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "SAY", 420, 160 )

   guiSay():New( oWindow, 2, 2, 18, 1, "Customer name:" )
   guiApplication():Run( oWindow )

RETURN

