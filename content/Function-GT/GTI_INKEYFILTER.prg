/*
 * $DOC$
 * $NAME$
 * GTI_INKEYFILTER
 *
 * $ONELINER$
 * Query or change a block that filters the keys
 *
 * $SYNTAX$
 * GtInfo( GTI_INKEYFILTER, [bFilter] ) --> bPrevious
 *
 * $ARGUMENTS$
 * `GTI_INKEYFILTER` The selector, from gtinfo.ch.
 * `bFilter` A block that receives a key code and returns the key code to deliver. NIL removes the
 * block.
 *
 * $RETURNS$
 * The block set before the call, or NIL.
 *
 * $DESCRIPTION$
 * Inkey() passes every key read from the keyboard to the block and returns its result instead. A
 * result of 0 drops the key. Use it to translate or block keys in the whole program.
 *
 * $NOTES$
 * Handled by the terminal layer, so it works with every GT driver.
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
 * GTI_INKEYREAD, Inkey()
 *
 * $DOCEND$
 */
