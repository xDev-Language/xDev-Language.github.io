/*
 * $DOC$
 * $NAME$
 * GTI_ICONFILE
 *
 * $ONELINER$
 * Set the icon of the window from a file
 *
 * $SYNTAX$
 * GtInfo( GTI_ICONFILE, cFile ) --> xResult
 *
 * $ARGUMENTS$
 * `GTI_ICONFILE` The selector, from gtinfo.ch.
 * `cFile` The name of the icon file. GTWVT reads ICO files.
 *
 * $RETURNS$
 * A value that depends on the driver. GTWVT returns the icon handle and GTSDL3 whether the icon
 * was set.
 *
 * $DESCRIPTION$
 * The icon is shown in the title bar of the window and in the task bar.
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
 * GTI_ICONRES, GTI_WINTITLE
 *
 * $DOCEND$
 */
