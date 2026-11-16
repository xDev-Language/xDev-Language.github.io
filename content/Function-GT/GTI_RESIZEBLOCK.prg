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

   LOCAL nResizes  := 0
   LOCAL bPrevious := GtInfo( GTI_RESIZEBLOCK, {|| nResizes++, s_DrawScreen( nResizes ) } )
   LOCAL nKey

   s_DrawScreen( nResizes )

   DO WHILE ( nKey := Inkey( 10 ) ) != K_ESC .AND. nKey != 0
   ENDDO

   GtInfo( GTI_RESIZEBLOCK, bPrevious )

RETURN

// draws the whole screen again for the current number of rows and columns
STATIC PROCEDURE s_DrawScreen( nResizes )

   Scroll()
   SetPos( 0, 0 )

   DispBox( 0, 0, MaxRow(), MaxCol() )
   DispOutAt( 1, 2, "Size: " + LTrim( Str( MaxRow() + 1 ) ) + " rows x " + LTrim( Str( MaxCol() + 1 ) ) + " columns" )
   DispOutAt( 2, 2, "The window changed its size " + LTrim( Str( nResizes ) ) + " times" )
   DispOutAt( 4, 2, "Drag the border of the window" )
   DispOutAt( 5, 2, "Esc or 10 seconds without a key ends the program" )

RETURN
