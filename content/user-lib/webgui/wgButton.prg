/*
 * $DOC$
 * $NAME$
 * wgButton
 *
 * $ONELINER$
 * Run an xDev code block from a button
 *
 * $SYNTAX$
 * wgButton():New( oParent, [cText] ) --> oButton
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
 * wgControl, wgLabel, wgMenu
 *
 * $DOCEND$
 */
