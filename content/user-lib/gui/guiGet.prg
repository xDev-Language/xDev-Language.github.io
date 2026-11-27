/*
 * $DOC$
 * $NAME$
 * guiGet
 *
 * $ONELINER$
 * Edit a variable through a GET field
 *
 * $SYNTAX$
 * guiGet():New( oWindow, nX, nY, [nLen], [nHeight], [@var], [cPicture], [nRows], [nMax] ) --> oGet
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
 * Class members declared by `guiGet`:
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
 * guiGet creates a fixed-font edit field for ReadModal(). With `@var`, it displays a local variable and writes the accepted value back when ReadModal() ends with saving. `nLen` is the visible number of characters. A longer value scrolls. `nRows` permits a field to grow temporarily for wrapped text, and `nMax` limits its length.
 *
 * The control inherits `value`, `picture`, `readOnly`, `maxLength`, `onChange` and `onValid` from guiEdit.
 *
 * $NOTES$
 * guiGet is part of the `gui` user library for Windows.
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
 * guiEdit, guiSay, guiWindow
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := Space( 30 )
   LOCAL oWindow := guiWindow():New( "GET", 420, 170 )

   guiSay():New( oWindow, 2, 2, 8, 1, "Name:" )
   guiGet():New( oWindow, 11, 2, 25, 1, @cName )
   oWindow:ReadModal()
   oWindow:Close()

RETURN

