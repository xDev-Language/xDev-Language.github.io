/*
 * $DOC$
 * $NAME$
 * wgEdit
 *
 * $ONELINER$
 * Edit a single line of text
 *
 * $SYNTAX$
 * wgEdit():New( oParent, [cValue], [cLabel] ) --> oEdit
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
 * `:value` contains the text in the field and `:text` contains its label. `onChange` runs for each user input after `:value` is updated. Use `wgGet` for a typed field with a picture or validation.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wgControl, wgGet, wgLabel
 *
 * $DOCEND$
 */
