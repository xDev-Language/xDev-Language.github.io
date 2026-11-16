/*
 * $DOC$
 * $NAME$
 * GTI_RENDERERNAME
 *
 * $ONELINER$
 * Return the name of the renderer
 *
 * $SYNTAX$
 * GtInfo( GTI_RENDERERNAME ) --> cName
 *
 * $ARGUMENTS$
 * `GTI_RENDERERNAME` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The driver and the drawing method, for example "WVT/GDI" or "SDL3/direct3d11".
 *
 * $DESCRIPTION$
 * Useful in error reports and to check which graphics method is in use.
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
 * GTI_VERSION
 *
 * $DOCEND$
 */
