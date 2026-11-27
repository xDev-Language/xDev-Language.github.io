/*
 * $DOC$
 * $NAME$
 * GTI_CONTENTSCALE
 *
 * $ONELINER$
 * Return the scale used to draw the content
 *
 * $SYNTAX$
 * GtInfo( GTI_CONTENTSCALE ) --> nScale
 *
 * $ARGUMENTS$
 * `GTI_CONTENTSCALE` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * The factor between the logical pixels of the program and the pixels of the display.
 *
 * $DESCRIPTION$
 * In GTWVT it equals GTI_DISPLAYSCALE.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
 *
 * Compare content scale and physical output size after moving the window between displays.
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
 * GTI_DISPLAYSCALE, GTI_LOGICALWIDTH
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

   LOCAL nScale, nWidth, nHeight, nKey

   DO WHILE .T.
      nScale := GtInfo( GTI_CONTENTSCALE )
      nWidth := GtInfo( GTI_OUTPUTWIDTH )
      nHeight := GtInfo( GTI_OUTPUTHEIGHT )
      IF ValType( nScale ) != "N"
         OutStd( "Content scale is unavailable.", Eol() )
         EXIT
      ENDIF

      Scroll()
      DispOutAt( 1, 2, "Content scale: " + LTrim( Str( nScale, 6, 2 ) ) )
      IF ValType( nWidth ) == "N" .AND. ValType( nHeight ) == "N"
         DispOutAt( 2, 2, "Output: " + LTrim( Str( nWidth ) ) + " x " + LTrim( Str( nHeight ) ) + " px" )
      ENDIF
      DispOutAt( 4, 2, "Move the window to another display. R refreshes, Esc exits." )
      nKey := Inkey( 10, INKEY_KEYBOARD )
      IF nKey != Asc( "R" ) .AND. nKey != Asc( "r" )
         EXIT
      ENDIF
   ENDDO

RETURN
