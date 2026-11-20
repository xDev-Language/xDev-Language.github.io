/*
 * $DOC$
 * $NAME$
 * wg_Get
 *
 * $ONELINER$
 * Edit a typed value with an input picture and validation
 *
 * $SYNTAX$
 * wg_Get():New( oParent, xValue, [cPicture], [cLabel] ) --> oGet
 * oGet:when := {| oGet | lAllow }
 * oGet:valid := {| oGet, xNewValue | lValid }
 * oGet:onChange := {| oGet | ... }
 *
 * $ARGUMENTS$
 * `oParent` Window or layout container.
 * `xValue` Initial text, numeric, date or logical value. It determines the type of `:value`.
 * `cPicture` Optional input and display picture.
 * `cLabel` Optional label above the field. Assign `:text` to change it.
 *
 * $RETURNS$
 * The GET field. `when` and `valid` must return `.T.` to allow focus or accept a changed value, respectively.
 *
 * $DESCRIPTION$
 * The field checks its picture on Enter or when it loses focus. A changed value that passes the picture and `valid` is stored in `:value` and then `onChange` runs. Enter moves to the next focusable control after the picture check. Text that fails the picture is marked. When `valid` refuses a change, the field is marked and regains focus. `when` runs on focus and can skip the field.
 *
 * | Type | Picture |
 * | --- | --- |
 * | Text | `9` accepts a digit, `A` a letter, `!` a letter converted to uppercase, and `X` a non-control character. Other characters are literals. A leading `@!` uppercases the text. A backslash escapes the next character. |
 * | Number | Use a numeric picture such as `"999,999.99"`. A prefix or suffix can accompany the number. |
 * | Date | Use `DD`, `MM` and `YYYY` with the desired separators. The default is `"DD.MM.YYYY"`. |
 * | Logical | Use two values separated by `/`, for example `"Yes/No"`. The default is `".T./.F."`. |
 *
 * Assign values of the original type to `:value` from xDev.
 *
 * $NOTES$
 * See `webgui-get.prg` in Examples.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wg_Control, wg_Edit, wg_CheckBox
 *
 * $DOCEND$
 */
