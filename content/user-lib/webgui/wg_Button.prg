/*
 * $DOC$
 * $NAME$
 * wg_Button
 *
 * $ONELINER$
 * Run an xDev code block from a button
 *
 * $SYNTAX$
 * wg_Button():New( oParent, [cText] ) --> oButton
 * oButton:onClick := {| oButton | ... }
 *
 * $ARGUMENTS$
 * `oParent` Window or layout container.
 * `cText` Button caption.
 *
 * $RETURNS$
 * The button object.
 *
 * $DESCRIPTION$
 * When the user activates the button, the `onClick` block receives the button. Assign `:text` to change its caption or `:enabled` to control whether it can be used.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wg_Control, wg_Label, wg_Menu
 *
 * $DOCEND$
 */
