/*
 * $DOC$
 * $NAME$
 * GFX_RECT
 *
 * $ONELINER$
 * Draw the outline of a rectangle
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_RECT, nTop, nLeft, nBottom, nRight, nColor ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_RECT` The operation, from gfxdef.ch.
 * `nTop` The pixel row of the top edge.
 * `nLeft` The pixel column of the left edge.
 * `nBottom` The pixel row of the bottom edge.
 * `nRight` The pixel column of the right edge.
 * `nColor` The color as 0xRRGGBB.
 *
 * $RETURNS$
 * 1, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_RECT draws the four edges of the rectangle as lines one pixel wide. The edges are part
 * of the rectangle, so it is nBottom - nTop + 1 pixels high and nRight - nLeft + 1 pixels
 * wide. The pixels inside keep their color. The part outside the window or the clip is not
 * drawn.
 *
 * $NOTES$
 * GFX_FILLEDRECT draws the same rectangle filled. A frame wider than one pixel is drawn as
 * several rectangles, each one pixel smaller on every side.
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
 * GFX_FILLEDRECT, GFX_LINE, GfxPrimitive()
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

   LOCAL nTop := 8 * GtInfo( GTI_FONTSIZE )
   LOCAL nIndex

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // Rectangles inside each other
   FOR nIndex := 0 TO 12
      GfxPrimitive( GFX_RECT, nTop + nIndex * 8, 40 + nIndex * 8, nTop + 240 - nIndex * 8, 360 - nIndex * 8, ;
                    GfxPrimitive( GFX_MAKECOLOR, 255 - nIndex * 18, 80 + nIndex * 12, 255 ) )
   NEXT

   // A frame four pixels wide
   FOR nIndex := 0 TO 3
      GfxPrimitive( GFX_RECT, nTop + 40 + nIndex, 440 + nIndex, nTop + 200 - nIndex, 720 - nIndex, 0xFFC040 )
   NEXT

   GfxPrimitive( GFX_RELEASESCREEN )

   Check( 'Corner of the frame         ', GfxPrimitive( GFX_GETPIXEL, nTop + 40, 440 ), 0xFFC040 )
   Check( 'Inner edge of the frame     ', GfxPrimitive( GFX_GETPIXEL, nTop + 120, 443 ), 0xFFC040 )
   Check( 'Inside stays as it was      ', GfxPrimitive( GFX_GETPIXEL, nTop + 120, 580 ), 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
