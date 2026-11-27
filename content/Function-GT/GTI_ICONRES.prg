/*
 * $DOC$
 * $NAME$
 * GTI_ICONRES
 *
 * $ONELINER$
 * Set the icon of the window from a resource
 *
 * $SYNTAX$
 * GtInfo( GTI_ICONRES, cName | nId ) --> xResult
 *
 * $ARGUMENTS$
 * `GTI_ICONRES` The selector, from gtinfo.ch.
 * `cName` The name of an icon resource of the program.
 * `nId` The number of an icon resource.
 *
 * $RETURNS$
 * A value that depends on the driver, as for GTI_ICONFILE.
 *
 * $DESCRIPTION$
 * Resources exist only in Windows programs. On other systems the icon does not change.
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
 * GTI_ICONFILE
 *
 * $DOCEND$
 */
