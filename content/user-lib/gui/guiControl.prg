/*
 * $DOC$
 * $NAME$
 * guiControl
 *
 * $ONELINER$
 * Use the members shared by GUI controls
 *
 * $SYNTAX$
 * oControl:SetFocus() --> oControl
 * oControl:Destroy() --> NIL
 * guiControl() --> oControlClass
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
 * Class members declared by `guiControl`:
 *
 * - Instance variables: `handle` (read-only), `parent` (read-only), `toolTipText` (internal),
 *   `popupMenu` (internal), `fontObject` (internal), `name` (read/write)
 * - Properties: `focused` (read-only), `font` (read/write), `text` (read/write), `value`
 *   (read/write), `x` (read/write), `y` (read/write), `width` (read/write), `height`
 *   (read/write), `toolTip` (read/write), `contextMenu` (read/write), `visible` (read/write),
 *   `enabled` (read/write), `anchor` (read/write)
 * - Methods: `SetFocus()`, `Destroy()`
 *
 * guiControl is the base class of controls. It is not created directly. SetFocus() moves keyboard focus to the control. Destroy() removes it from its parent. Assigning the geometry uses logical pixels.
 *
 * Common properties are `text`, `value`, `visible`, `enabled`, `anchor`, `x`, `y`, `width`, `height`, `toolTip`, `contextMenu` and `font`. The read-only properties are `focused`, `handle` and `parent`. `name` lets the parent window find a control by message.
 *
 * $NOTES$
 * guiControl is part of the `gui` user library for Windows.
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
 * GUI, guiWindow, guiFont, guiLabel
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Control", 420, 180 )
   LOCAL oEdit := guiEdit():New( oWindow, 20, 30, 380, 25, "" )

   oEdit:toolTip := "Enter text"
   oEdit:anchor := "LTR"
   oEdit:SetFocus()
   guiApplication():Run( oWindow )

RETURN

