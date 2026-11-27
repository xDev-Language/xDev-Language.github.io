/*
 * $DOC$
 * $NAME$
 * GTI_ISCTWIN
 *
 * $ONELINER$
 * Tell whether the driver has its own CT windows
 *
 * $SYNTAX$
 * GtInfo( GTI_ISCTWIN ) --> lSupported
 *
 * $ARGUMENTS$
 * `GTI_ISCTWIN` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * .F. for all xDev graphics drivers.
 *
 * $DESCRIPTION$
 * The window functions WOpen(), WBox() and the others work in xDev with every driver through a
 * common layer, so no driver needs its own support.
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
 * GTI_ISMULTIWIN, WOpen()
 *
 * $DOCEND$
 */
