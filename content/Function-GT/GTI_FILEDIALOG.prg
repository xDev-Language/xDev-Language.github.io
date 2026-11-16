/*
 * $DOC$
 * $NAME$
 * GTI_FILEDIALOG
 *
 * $ONELINER$
 * Show a system dialog to choose files or a folder
 *
 * $SYNTAX$
 * GtInfo( GTI_FILEDIALOG, aOptions ) --> aResult
 *
 * $ARGUMENTS$
 * `GTI_FILEDIALOG` The selector, from gtinfo.ch.
 * `aOptions` { cType, cTitle, cDirectory, aFilters, lMany }. cType is "OPEN", "SAVE" or "FOLDER".
 * cDirectory is the folder to start in, or a file name. aFilters holds { cName, cPattern } pairs
 * with patterns such as "png;jpg" or "*". lMany allows choosing several files to open.
 *
 * $RETURNS$
 * { lOk, aFiles, nFilter, cError }: whether files were chosen, their full names, the number of
 * the selected filter, and an error message or an empty string.
 *
 * $DESCRIPTION$
 * Cancelling the dialog is not an error: lOk is .F. and cError is empty.
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
 * GTI_OPENURL
 *
 * $DOCEND$
 */
