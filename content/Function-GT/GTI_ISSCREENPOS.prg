/*
 * $DOC$
 * $NAME$
 * GTI_ISSCREENPOS
 *
 * $ONELINER$
 * Tell whether the cursor can be placed anywhere on the screen
 *
 * $SYNTAX$
 * GtInfo( GTI_ISSCREENPOS ) --> lSupported
 *
 * $ARGUMENTS$
 * `GTI_ISSCREENPOS` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * .T. when SetPos() and DevPos() can place the cursor at any cell.
 *
 * $DESCRIPTION$
 * GTI_FULLSCREEN is an old name of the same constant. Do not use it in new programs.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
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
 * GTI_FULLSCREEN, GTI_KBDSUPPORT, GTI_ISFULLSCREEN
 *
 * $DOCEND$
 */
