/*
 * $DOC$
 * $NAME$
 * GTI_SCREENWIDTH
 *
 * $ONELINER$
 * Query or change the width of the window in pixels
 *
 * $SYNTAX$
 * GtInfo( GTI_SCREENWIDTH, [nPixels] ) --> nPixels
 *
 * $ARGUMENTS$
 * `GTI_SCREENWIDTH` The selector, from gtinfo.ch.
 * `nPixels` The new width of the text area in pixels.
 *
 * $RETURNS$
 * The width before the call: the number of columns times the width of a cell.
 *
 * $DESCRIPTION$
 * A new width changes the size of the window, but not while the window is maximized or in full
 * screen. GTI_RESIZEFONT decides whether the font or the number of columns follows the new size.
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
 * GTI_SCREENHEIGHT, GTI_SCREENSIZE, GTI_RESIZEFONT, GTI_FONTWIDTH
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
