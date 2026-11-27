/*
 * $DOC$
 * $NAME$
 * guiEdit
 *
 * $ONELINER$
 * Edit one line of text, a number or a date
 *
 * $SYNTAX$
 * guiEdit():New( oWindow, nX, nY, [nWidth], [nHeight], [cText] ) --> oEdit
 * oEdit:value --> xValue
 * oEdit:value := xValue
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
 * Class members declared by `guiEdit`:
 *
 * - Instance variables: `onChange` (read/write), `onValid` (read/write)
 * - Properties: `readOnly` (read/write), `maxLength` (read/write), `picture` (read/write),
 *   `value` (read/write)
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
 * The control edits one line. `value` preserves the type assigned by the program: text, number or date. A picture formats and validates the value. `onChange` runs after every text change. `onValid` runs when focus is leaving and may return `.F.` to keep focus in the field. Both blocks receive the control.
 *
 * `readOnly` allows or forbids changes by the user. `maxLength` limits the number of entered characters; 0 restores the system limit. `picture` contains the formatting picture. The class inherits guiControl members.
 *
 * $NOTES$
 * guiEdit is part of the `gui` user library for Windows.
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
 * guiControl, guiGet, guiMemo, guiWindow
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Edit", 420, 170 )
   LOCAL oEdit := guiEdit():New( oWindow, 20, 35, 380, 25, "" )

   oEdit:maxLength := 40
   oEdit:onChange := {| o | oWindow:title := o:text }
   guiApplication():Run( oWindow )

RETURN

