/*
 * $DOC$
 * $NAME$
 * wg_Edit
 *
 * $ONELINER$
 * Edit a single line of text
 *
 * $SYNTAX$
 * wg_Edit():New( oParent, [cValue], [cLabel] ) --> oEdit
 * oEdit:onChange := {| oEdit | ... }
 *
 * $ARGUMENTS$
 * `oParent` Window or layout container.
 * `cValue` Initial text. The default is an empty string.
 * `cLabel` Optional label shown above the field.
 *
 * $RETURNS$
 * The edit control.
 *
 * $DESCRIPTION$
 * `:value` contains the text in the field and `:text` contains its label. `onChange` runs for each user input after `:value` is updated. Use `wg_Get` for a typed field with a picture or validation.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wg_Control, wg_Get, wg_Label
 *
 * $DOCEND$
 */
