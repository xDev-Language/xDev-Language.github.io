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
 * Resize the text area in cell-width steps and report the actual pixel width and number of columns.
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

   LOCAL nSaved := GtInfo( GTI_SCREENWIDTH )
   LOCAL nCell := GtInfo( GTI_FONTWIDTH )
   LOCAL nDesk := GtInfo( GTI_DESKTOPWIDTH )
   LOCAL nWidth, nKey

   IF ValType( nSaved ) != "N" .OR. ValType( nCell ) != "N" .OR. nCell <= 0
      OutStd( "Text width controls unavailable.", Eol() )
      RETURN
   ENDIF
   IF ValType( nDesk ) != "N" .OR. nDesk < nSaved
      nDesk := nSaved
   ENDIF

   DO WHILE .T.
      nWidth := GtInfo( GTI_SCREENWIDTH )
      Scroll()
      DispOutAt( 1, 2, "Text area: " + LTrim( Str( nWidth ) ) + " px" )
      DispOutAt( 2, 2, "Columns: " + LTrim( Str( MaxCol() + 1 ) ) )
      DispOutAt( 4, 2, "+ / - resize by eight cells. R resets. Esc exits." )
      nKey := Inkey( 10, INKEY_KEYBOARD )
      DO CASE
      CASE nKey == 0 .OR. nKey == K_ESC
         EXIT
      CASE nKey == Asc( "+" )
         GtInfo( GTI_SCREENWIDTH, Min( nDesk, nWidth + 8 * nCell ) )
      CASE nKey == Asc( "-" )
         GtInfo( GTI_SCREENWIDTH, Max( Min( nSaved, 52 * nCell ), nWidth - 8 * nCell ) )
      CASE nKey == Asc( "R" ) .OR. nKey == Asc( "r" )
         GtInfo( GTI_SCREENWIDTH, nSaved )
      ENDCASE
   ENDDO

   GtInfo( GTI_SCREENWIDTH, nSaved )

RETURN
