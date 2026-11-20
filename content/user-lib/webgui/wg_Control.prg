/*
 * $DOC$
 * $NAME$
 * wg_Control
 *
 * $ONELINER$
 * Common properties and events of WebGUI controls
 *
 * $SYNTAX$
 * oControl:SetFocus() --> oControl
 * oControl:Destroy() --> oControl
 * oControl:onClick := {| oControl | ... }
 * oControl:onChange := {| oControl | ... }
 *
 * $RETURNS$
 * `SetFocus()` and `Destroy()` return the control.
 *
 * $DESCRIPTION$
 * `wg_Control` is the base class for WebGUI controls. Create a concrete control with its `New()` method. Most constructors take a window, a row, a column or a panel as `oParent`.
 *
 * | Property | Meaning |
 * | --- | --- |
 * | `parent` | Read-only parent object. |
 * | `id` | Read-only numeric identifier within the window. |
 * | `text` | Caption of a label, button or check box, label of an edit, GET or combo box, or title of a menu. |
 * | `value` | Current value. The supported type depends on the control. |
 * | `enabled` | Logical state of an interactive control. Initially `.T.`. |
 * | `visible` | Logical visibility. Initially `.T.`. |
 * | `x`, `y` | Left and top offsets in logical pixels. A nonnegative offset places the control outside the normal layout. Set both to `NIL` to restore automatic placement. |
 * | `width`, `height` | Positive size in logical pixels, or `NIL` to use automatic sizing. |
 * | `grow` | `.T.` shares the remaining height in a column or width in a row. Several growing controls share that space. |
 *
 * `SetFocus()` requests focus for a control that accepts it. `Destroy()` removes the control from the page. The events supported by a control are listed on its reference page. `onChange` receives the control after its value is updated. Assigning `:value` from xDev updates the display without calling `onChange`. Sidebar placement and sizing follow the rules in `wg_Sidebar`.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * WebGUI, wg_Window, wg_Column, wg_Row, wg_Box
 *
 * $DOCEND$
 */
