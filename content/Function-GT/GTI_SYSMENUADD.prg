/*
 * $DOC$
 * $NAME$
 * GTI_SYSMENUADD
 *
 * $ONELINER$
 * Add an item to the system menu of the window
 *
 * $SYNTAX$
 * GtInfo( GTI_SYSMENUADD, nKey, [cText] ) --> lDone
 *
 * $ARGUMENTS$
 * `GTI_SYSMENUADD` The selector, from gtinfo.ch.
 * `nKey` The key code that Inkey() returns when the item is chosen.
 * `cText` The text of the item. Without cText the item of nKey is removed.
 *
 * $RETURNS$
 * .T. when an item was added, changed or removed.
 *
 * $DESCRIPTION$
 * The system menu opens from the icon in the title bar. A second call with the same nKey changes
 * the text of its item.
 *
 * $NOTES$
 * Supported only by GTWVT. Other drivers return NIL.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions GT
 *
 * $HEADER$
 * gtinfo.ch
 *
 * $SEEALSO$
 * Inkey()
 *
 * $DOCEND$
 */
