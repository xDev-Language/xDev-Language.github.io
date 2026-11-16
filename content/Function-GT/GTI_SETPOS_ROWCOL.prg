/*
 * $DOC$
 * $NAME$
 * GTI_SETPOS_ROWCOL
 *
 * $ONELINER$
 * Query or change the position of the window in text cells
 *
 * $SYNTAX$
 * GtInfo( GTI_SETPOS_ROWCOL, [nRow, nCol | aPosition] ) --> aPosition
 *
 * $ARGUMENTS$
 * `GTI_SETPOS_ROWCOL` The selector, from gtinfo.ch.
 * `nRow` The new top edge of the window in rows of the font.
 * `nCol` The new left edge of the window in columns of the font.
 * `aPosition` The new position as { nRow, nCol }.
 *
 * $RETURNS$
 * The position before the call as { nRow, nCol }.
 *
 * $DESCRIPTION$
 * It works as GTI_SETPOS_XY, but counts in cells of the current font.
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
 * GTI_SETPOS_XY
 *
 * $DOCEND$
 */
