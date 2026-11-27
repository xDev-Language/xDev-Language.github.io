/*
 * $DOC$
 * $NAME$
 * GTI_WINHANDLE
 *
 * $ONELINER$
 * Return the system handle of the window
 *
 * $SYNTAX$
 * GtInfo( GTI_WINHANDLE ) --> pHandle
 *
 * $ARGUMENTS$
 * `GTI_WINHANDLE` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The handle as a pointer: the HWND in GTWVT, the window of SDL, X11 or GLFW in the other
 * drivers.
 *
 * $DESCRIPTION$
 * Pass it to system functions or libraries that work with the window directly.
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
 * GTI_ONLINE
 *
 * $DOCEND$
 */
