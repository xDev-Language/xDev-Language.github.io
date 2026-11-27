/*
 * $DOC$
 * $NAME$
 * GTI_RESIZEBLOCK
 *
 * $ONELINER$
 * Query or change the block called after a resize
 *
 * $SYNTAX$
 * GtInfo( GTI_RESIZEBLOCK, [bBlock] ) --> bPrevious
 *
 * $ARGUMENTS$
 * `GTI_RESIZEBLOCK` The selector, from gtinfo.ch.
 * `bBlock` A block without arguments. NIL removes the block.
 *
 * $RETURNS$
 * The block set before the call, or NIL.
 *
 * $DESCRIPTION$
 * The terminal evaluates the block after the window changed the number of rows or columns, also
 * while the user drags the border. The block draws the screen again for the new MaxRow() and
 * MaxCol().
 *
 * $NOTES$
 * Handled by the terminal layer, so it works with every GT driver.
 *
 * Redraw a responsive dashboard when the grid changes and omit the instructions at narrow widths.
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
 * GTI_RESIZABLE, GTI_RESIZEFONT, MaxRow(), MaxCol()
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

   LOCAL nResizes := 0
   LOCAL bSaved := GtInfo( GTI_RESIZEBLOCK, {|| nResizes++, s_Draw( nResizes ) } )
   LOCAL nKey

   s_Draw( nResizes )
   DO WHILE ( nKey := Inkey( 15, INKEY_KEYBOARD + INKEY_GTEVENT ) ) != 0 .AND. nKey != K_ESC
   ENDDO
   GtInfo( GTI_RESIZEBLOCK, bSaved )

RETURN

STATIC PROCEDURE s_Draw( nResizes )

   LOCAL nLast := MaxCol()
   LOCAL cSize := LTrim( Str( MaxRow() + 1 ) ) + " rows x " + LTrim( Str( nLast + 1 ) ) + " columns"

   DispBegin()
   Scroll()
   IF MaxRow() >= 5 .AND. nLast >= 8
      DispBox( 0, 0, MaxRow(), nLast )
      DispOutAt( 1, 2, Left( cSize, nLast - 3 ) )
      DispOutAt( 2, 2, Left( "Resizes: " + LTrim( Str( nResizes ) ), nLast - 3 ) )
      IF nLast >= 60
         DispOutAt( 4, 2, "Drag an edge to resize the window. Esc exits." )
      ENDIF
   ENDIF
   DispEnd()

RETURN
