/*
 * $DOC$
 * $NAME$
 * guiDatePicker
 *
 * $ONELINER$
 * Select a date from a drop-down calendar
 *
 * $SYNTAX$
 * guiDatePicker():New( oWindow, nX, nY, [nWidth], [nHeight] ) --> oDate
 * oDate:value --> dDate
 * oDate:value := dDate
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
 * Class members declared by `guiDatePicker`:
 *
 * - Instance variables: `onChange` (read/write)
 * - Properties: `value` (read/write)
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
 * The control shows a date field with a drop-down calendar. `value` is always a DATE; an empty date is not accepted. `onChange` runs after a user change and receives the control.
 *
 * The default size is 120 by 23 logical pixels. The class inherits guiControl members.
 *
 * $NOTES$
 * guiDatePicker is part of the `gui` user library for Windows.
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
 * guiControl, guiEdit
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Date", 360, 150 )
   LOCAL oDate := guiDatePicker():New( oWindow, 30, 45, 180, 25 )

   oDate:value := Date()
   guiApplication():Run( oWindow )

RETURN

