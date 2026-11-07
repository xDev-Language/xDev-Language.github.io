/*
 * $DOC$
 * $NAME$
 * GtInfo( ... )
 *
 * $ONELINER$
 * Set the code block evaluated after the window changed its size
 *
 * $SYNTAX$
 * GtInfo( GTI_RESIZEBLOCK, [bBlock] ) --> bPrevious
 *
 * $ARGUMENTS$
 * GTI_RESIZEBLOCK
 * bBlock
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
