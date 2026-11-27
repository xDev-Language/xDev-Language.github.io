/*
 * $DOC$
 * $NAME$
 * GTI_ISMULTIWIN
 *
 * $ONELINER$
 * Tell whether the driver can open several windows
 *
 * $SYNTAX$
 * GtInfo( GTI_ISMULTIWIN ) --> lSupported
 *
 * $ARGUMENTS$
 * `GTI_ISMULTIWIN` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * .F. for all xDev graphics drivers.
 *
 * $DESCRIPTION$
 * Every xDev program has one terminal window.
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
 * GTI_ISCTWIN
 *
 * $DOCEND$
 */
