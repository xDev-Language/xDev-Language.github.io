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
 * Compare saved screen bytes under both flag values, then restore the sample with RestScreen().
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

#include "inkey.ch"
#include "gtinfo.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL lSaved := GtInfo( GTI_COMPATBUFFER, .F. )
   LOCAL cNative, cCompatible

   DispOutAt( 0, 0, "ABCD", "W+/B" )
   cNative := SaveScreen( 0, 0, 0, 3 )
   GtInfo( GTI_COMPATBUFFER, .T. )
   cCompatible := SaveScreen( 0, 0, 0, 3 )
   DispOutAt( 0, 0, "----" )
   RestScreen( 0, 0, 0, 3, cCompatible )
   OutStd( "Both modes saved identical bytes: ", cNative == cCompatible, Eol() )
   GtInfo( GTI_COMPATBUFFER, lSaved )
   Inkey( 3 )

RETURN
