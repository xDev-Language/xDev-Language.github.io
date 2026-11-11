/*
 * $DOC$
 * $NAME$
 * GFX_PUTPIXEL
 *
 * $ONELINER$
 * Set the color of one pixel
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_PUTPIXEL, nTop, nLeft, nColor ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_PUTPIXEL` The operation, from gfxdef.ch.
 * `nTop` The pixel row.
 * `nLeft` The pixel column.
 * `nColor` The color as 0xRRGGBB. It is the third number, not the fifth.
 *
 * $RETURNS$
 * 1, also when the pixel is outside the clip. On a terminal without graphics the result is 0.
 *
 * $DESCRIPTION$
 * GFX_PUTPIXEL draws a single pixel. A pixel outside the window or the clip is not drawn.
 * In GFX_MODE_XOR the pixel gets its old color XOR nColor.
 *
 * $NOTES$
 * For many pixels in a row, GFX_LINE and GFX_FILLEDRECT are much faster than a loop of
 * GFX_PUTPIXEL. Draw many single pixels between GFX_ACQUIRESCREEN and GFX_RELEASESCREEN.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions GFX
 *
 * $HEADER$
 * gfxdef.ch
 *
 * $SEEALSO$
 * GFX_GETPIXEL, GFX_LINE, GFX_DRAWINGMODE
 *
 * $DOCEND$
 */

#include "gfxdef.ch"
#include "gtinfo.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nTop   := 8 * GtInfo( GTI_FONTSIZE )
   LOCAL nWidth := GtInfo( GTI_SCREENWIDTH )
   LOCAL nMiddle := nTop + 80
   LOCAL nCol
   LOCAL nIndex

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // A sine wave of single pixels
   FOR nCol := 0 TO nWidth - 1
      GfxPrimitive( GFX_PUTPIXEL, nMiddle + Int( Sin( nCol / 40 ) * 60 ), nCol, 0x40FF40 )
   NEXT

   // Stars at random places below the wave
   FOR nIndex := 1 TO 400
      GfxPrimitive( GFX_PUTPIXEL, nTop + 160 + Random( 0, 80 ), Random( 0, nWidth - 1 ), 0xFFFFFF )
   NEXT

   GfxPrimitive( GFX_RELEASESCREEN )

   Check( 'GFX_PUTPIXEL                ', GfxPrimitive( GFX_PUTPIXEL, nTop + 260, 10, 0x123456 ), 1 )
   Check( 'GFX_GETPIXEL of that pixel  ', GfxPrimitive( GFX_GETPIXEL, nTop + 260, 10 ), 0x123456 )
   Check( 'Wave at column 0            ', GfxPrimitive( GFX_GETPIXEL, nMiddle, 0 ), 0x40FF40 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
