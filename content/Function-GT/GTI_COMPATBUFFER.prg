/*
 * $DOC$
 * $NAME$
 * GTI_COMPATBUFFER
 *
 * $ONELINER$
 * Query or change the format of SaveScreen() buffers
 *
 * $SYNTAX$
 * GtInfo( GTI_COMPATBUFFER, [lCompatible] ) --> lCompatible
 *
 * $ARGUMENTS$
 * `GTI_COMPATBUFFER` The selector, from gtinfo.ch.
 * `lCompatible` .T. for the DOS format, .F. for the xDev format.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * With .T. SaveScreen() and RestScreen() would use the DOS format of two bytes per cell, the
 * character and the color attribute. xDev keeps the setting, but its screen buffers always use
 * the xDev format.
 *
 * $NOTES$
 * Handled by the terminal layer, so it works with every GT driver.
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
 * GTI_GETWIN, GTI_SETWIN
 *
 * $DOCEND$
 */

#include "gtinfo.ch"

PROCEDURE Main()

   QOut( "Compatible buffers: " + IIF( GtInfo( GTI_COMPATBUFFER ), "YES", "NO" ) )

RETURN
