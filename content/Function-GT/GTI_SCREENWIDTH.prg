/*
 * $DOC$
 * $NAME$
 * GtInfo( ... )
 *
 * $ONELINER$
 * Query or change the width of the window in pixels
 *
 * $SYNTAX$
 * GtInfo( GTI_SCREENWIDTH, [nPixels] ) --> nPixels
 *
 * $ARGUMENTS$
 * GTI_SCREENWIDTH
 * nPixels
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
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

   LOCAL nKey := 0

   DO WHILE nKey != K_ESC
      DO CASE
      CASE nKey == Asc( "+" )
         GtInfo( GTI_SCREENWIDTH, GtInfo( GTI_SCREENWIDTH ) + 80 )
      CASE nKey == Asc( "-" )
         GtInfo( GTI_SCREENWIDTH, GtInfo( GTI_SCREENWIDTH ) - 80 )
      ENDCASE

      Scroll()
      SetPos( 0, 0 )
      
      DispOutAt( 1, 2, "Width of the window: " + LTrim( Str( GtInfo( GTI_SCREENWIDTH ) ) ) + " pixels" )
      DispOutAt( 2, 2, "Columns:             " + LTrim( Str( MaxCol() + 1 ) ) )
      DispOutAt( 4, 2, "+ makes the window wider, - makes it narrower" )
      DispOutAt( 5, 2, "Esc or 10 seconds without a key ends the program" )

      IF ( nKey := Inkey( 10 ) ) == 0
         EXIT
      ENDIF
   ENDDO

RETURN
