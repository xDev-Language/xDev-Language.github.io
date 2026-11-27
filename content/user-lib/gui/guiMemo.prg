/*
 * $DOC$
 * $NAME$
 * guiMemo
 *
 * $ONELINER$
 * Edit text in several lines
 *
 * $SYNTAX$
 * guiMemo():New( oWindow, nX, nY, [nWidth], [nHeight], [cText] ) --> oMemo
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
 * Class members declared by `guiMemo`:
 *
 * - Instance variables: none
 * - Properties: none
 * - Methods: `New()`
 *
 * Inherited from `guiEdit`:
 *
 * - Instance variables: `onChange` (read/write), `onValid` (read/write)
 * - Properties: `readOnly` (read/write), `maxLength` (read/write), `picture` (read/write),
 *   `value` (read/write)
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
 * guiMemo is a multi-line edit field with a vertical scroll bar. The default size is 200 by 80 logical pixels. Its `text` property returns lines separated by CR LF.
 *
 * The class inherits guiEdit members, including `value`, `readOnly`, `maxLength`, `onChange` and `onValid`.
 *
 * $NOTES$
 * guiMemo is part of the `gui` user library for Windows.
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
 * guiEdit, guiGet, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Memo", 480, 260 )
   LOCAL oMemo := guiMemo():New( oWindow, 20, 20, 440, 220, "First line" )

   oMemo:anchor := "LTRB"
   guiApplication():Run( oWindow )

RETURN

