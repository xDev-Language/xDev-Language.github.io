/*
 * $DOC$
 * $NAME$
 * GFX_CIRCLE
 *
 * $ONELINER$
 * Draw the outline of a circle
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_CIRCLE, nTop, nLeft, nRadius, nColor ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_CIRCLE` The operation, from gfxdef.ch.
 * `nTop` The pixel row of the center.
 * `nLeft` The pixel column of the center.
 * `nRadius` The radius in pixels.
 * `nColor` The color as 0xRRGGBB. It is the fourth number, not the fifth.
 *
 * $RETURNS$
 * 1, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_CIRCLE draws a circle one pixel wide around the center. The circle reaches nRadius
 * pixels from the center in every direction, so it is 2 * nRadius + 1 pixels wide. The pixels
 * inside keep their color. A negative radius draws nothing, and the part outside the window
 * or the clip is not drawn.
 *
 * $NOTES$
 * Unlike the rectangle operations, nTop and nLeft are the center, not a corner. GFX_ELLIPSE
 * draws a circle with different vertical and horizontal radii.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $IMAGE$
 * GFX_CIRCLE.png
 *
 * $CATEGORY$
 * Functions GFX
 *
 * $HEADER$
 * gfxdef.ch
 *
 * $SEEALSO$
 * GFX_FILLEDCIRCLE, GFX_ELLIPSE, GfxPrimitive()
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
   LOCAL nRow := nTop + 120
   LOCAL nIndex

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // Circles around one center
   FOR nIndex := 1 TO 11
      GfxPrimitive( GFX_CIRCLE, nRow, 160, nIndex * 10, GfxPrimitive( GFX_MAKECOLOR, nIndex * 23, 255, 255 - nIndex * 23 ) )
   NEXT

   // Olympic rings
   GfxPrimitive( GFX_CIRCLE, nRow - 25, 420, 40, 0x0080FF )
   GfxPrimitive( GFX_CIRCLE, nRow - 25, 510, 40, 0xFFFFFF )
   GfxPrimitive( GFX_CIRCLE, nRow - 25, 600, 40, 0xFF2020 )
   GfxPrimitive( GFX_CIRCLE, nRow + 15, 465, 40, 0xFFD000 )
   GfxPrimitive( GFX_CIRCLE, nRow + 15, 555, 40, 0x20C040 )

   GfxPrimitive( GFX_RELEASESCREEN )

   Check( 'Top of the largest circle   ', GfxPrimitive( GFX_GETPIXEL, nRow - 110, 160 ), ;
          GfxPrimitive( GFX_MAKECOLOR, 11 * 23, 255, 255 - 11 * 23 ) )
   Check( 'The center stays as it was  ', GfxPrimitive( GFX_GETPIXEL, nRow, 160 ), 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
