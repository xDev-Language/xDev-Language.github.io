/*
 * $DOC$
 * $NAME$
 * GTI_RESIZESTEP
 *
 * $ONELINER$
 * Query or change whether the window size follows whole cells
 *
 * $SYNTAX$
 * GtInfo( GTI_RESIZESTEP, [lStep] ) --> lStep
 *
 * $ARGUMENTS$
 * `GTI_RESIZESTEP` The selector, from gtinfo.ch.
 * `lStep` .T. lets the window change its size only by whole rows and columns.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * With .T. the window gets at once the size of whole cells again.
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
 * GTI_RESIZABLE, GTI_RESIZEFONT
 *
 * $DOCEND$
 */
