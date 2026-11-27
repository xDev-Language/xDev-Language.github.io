/*
 * $DOC$
 * $NAME$
 * wgComboBox
 *
 * $ONELINER$
 * Choose one item from a drop-down list
 *
 * $SYNTAX$
 * wgComboBox():New( oParent, aItems, [cLabel], [nSelected] ) --> oComboBox
 * oComboBox:onChange := {| oComboBox | ... }
 *
 * $ARGUMENTS$
 * `oParent` Window or layout container.
 * `aItems` Array of list items in display order.
 * `cLabel` Optional label shown above the list.
 * `nSelected` Initial one-based index. The default is 1. Use 0 for an initially unselected list.
 *
 * $RETURNS$
 * The combo box object.
 *
 * $DESCRIPTION$
 * `:value` contains the index and `:text` contains the label. `onChange` runs when the user selects an item. Read `aItems[ oComboBox:value ]` when the index identifies an item.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * wgControl, wgEdit, wgCheckBox
 *
 * $DOCEND$
 */
