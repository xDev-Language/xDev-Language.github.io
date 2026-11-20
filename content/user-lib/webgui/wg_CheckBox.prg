/*
 * $DOC$
 * $NAME$
 * wg_CheckBox
 *
 * $ONELINER$
 * Edit a logical value with a check box
 *
 * $SYNTAX$
 * wg_CheckBox():New( oParent, [cText], [lChecked] ) --> oCheckBox
 * oCheckBox:onChange := {| oCheckBox | ... }
 *
 * $ARGUMENTS$
 * `oParent` Window or layout container.
 * `cText` Caption displayed next to the check box.
 * `lChecked` Initial state. The default is `.F.`.
 *
 * $RETURNS$
 * The check box object.
 *
 * $DESCRIPTION$
 * `:value` is `.T.` when checked and `.F.` when clear. `onChange` runs when the user toggles the check box. Assign `:text` to change the caption.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wg_Control, wg_ComboBox, wg_Get
 *
 * $DOCEND$
 */
