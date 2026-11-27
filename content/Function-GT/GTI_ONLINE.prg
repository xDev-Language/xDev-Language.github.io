/*
 * $DOC$
 * $NAME$
 * GTI_ONLINE
 *
 * $ONELINER$
 * Tell whether the terminal is connected
 *
 * $SYNTAX$
 * GtInfo( GTI_ONLINE ) --> lOnline
 *
 * $ARGUMENTS$
 * `GTI_ONLINE` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * .T. while the terminal can show output. GTWVT returns .T. once its window exists.
 *
 * $DESCRIPTION$
 * The window of GTWVT is created with the first output, so a program can check whether it is open
 * yet.
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
 * GTI_WINHANDLE
 *
 * $DOCEND$
 */
