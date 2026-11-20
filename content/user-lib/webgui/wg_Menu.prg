/*
 * $DOC$
 * $NAME$
 * wg_Menu
 *
 * $ONELINER$
 * Add menus and keyboard shortcuts to a window
 *
 * $SYNTAX$
 * wg_Menu():New( oWindow, cTitle, [bAction] ) --> oMenu
 * oMenu:Add( cText, bAction, [cShortcut] ) --> oMenu
 * oMenu:AddSeparator() --> oMenu
 *
 * $ARGUMENTS$
 * `oWindow` Window that owns the menu bar.
 * `cTitle` Title in the menu bar.
 * `cText` Text of a menu item.
 * `bAction` Block that receives the menu. In `New()` it is the `onClick` block of a title with no items. In `Add()` it runs when the item is chosen.
 * `cShortcut` Optional key combination such as `"Ctrl+N"`, `"Ctrl+Shift+S"`, `"F2"` or `"Del"`.
 *
 * $RETURNS$
 * `New()` returns the menu. `Add()` and `AddSeparator()` return the same menu.
 *
 * $DESCRIPTION$
 * Each menu appears at the top of its window. Clicking a title opens its items. A title with no items runs its own action. `AddSeparator()` inserts a line between items. Use the arrow keys, Home, End and Esc to move through or close the menu.
 *
 * Shortcuts are displayed beside their items. While the focus is in a text field or drop-down list, shortcuts that use Ctrl, Alt or a function key can still run. Other keys remain available to that field.
 *
 * $NOTES$
 * See `webgui-menu.prg` in Examples.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wg_Window, wg_Control, wg_Button
 *
 * $DOCEND$
 */
