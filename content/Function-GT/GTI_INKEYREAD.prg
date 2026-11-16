/*
 * $DOC$
 * $NAME$
 * GTI_INKEYREAD
 *
 * $ONELINER$
 * Query or change a block that supplies keys
 *
 * $SYNTAX$
 * GtInfo( GTI_INKEYREAD, [bRead] ) --> bPrevious
 *
 * $ARGUMENTS$
 * `GTI_INKEYREAD` The selector, from gtinfo.ch.
 * `bRead` A block without arguments that returns a key code or 0. NIL removes the block.
 *
 * $RETURNS$
 * The block set before the call, or NIL.
 *
 * $DESCRIPTION$
 * Inkey() evaluates the block before it reads the keyboard. A result other than 0 is returned as
 * the key, so the block can feed keys from another source.
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
 * GTI_INKEYFILTER, Inkey()
 *
 * $DOCEND$
 */
