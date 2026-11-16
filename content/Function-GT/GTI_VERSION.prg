/*
 * $DOC$
 * $NAME$
 * GTI_VERSION
 *
 * $ONELINER$
 * Return the name of the GT driver
 *
 * $SYNTAX$
 * GtInfo( GTI_VERSION, [nType] ) --> cVersion
 *
 * $ARGUMENTS$
 * `GTI_VERSION` The selector, from gtinfo.ch.
 * `nType` 0 for the short name, another number for a description.
 *
 * $RETURNS$
 * The short name such as "WVT", or a description such as "xDev Terminal: Windows GUI console
 * (WVT)".
 *
 * $DESCRIPTION$
 * GtVersion() returns the same text.
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
 * GtVersion(), GTI_RENDERERNAME
 *
 * $DOCEND$
 */
