/*
 * $DOC$
 * $NAME$
 * GFX_FILLEDCIRCLE
 *
 * $ONELINER$
 * Draw a filled circle
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_FILLEDCIRCLE, nTop, nLeft, nRadius, nColor ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_FILLEDCIRCLE` The operation, from gfxdef.ch.
 * `nTop` The pixel row of the center.
 * `nLeft` The pixel column of the center.
 * `nRadius` The radius in pixels.
 * `nColor` The color as 0xRRGGBB. It is the fourth number, not the fifth.
 *
 * $RETURNS$
 * 1, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_FILLEDCIRCLE paints every pixel of the circle, its outline included, with nColor. The
 * circle has the same pixels as GFX_CIRCLE with the same arguments, together with the inside.
 * A radius of 0 paints the center pixel and a negative radius draws nothing. The part outside
 * the window or the clip is not drawn.
 *
 * $NOTES$
 * GFX_FILLEDELLIPSE draws a filled circle with different vertical and horizontal radii.
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
 * GFX_CIRCLE, GFX_FILLEDELLIPSE, GfxPrimitive()
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
   LOCAL nRow   := nTop + 120
   LOCAL aColor := { 0xFFFFFF, 0x202020, 0x2080FF, 0xFF2020, 0xFFE020 }
   LOCAL nIndex

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // A target: filled circles from the largest to the smallest
   FOR nIndex := 1 TO Len( aColor )
      GfxPrimitive( GFX_FILLEDCIRCLE, nRow, 160, 120 - ( nIndex - 1 ) * 24, aColor[ nIndex ] )
   NEXT

   // A traffic light
   GfxPrimitive( GFX_FILLEDRECT, nTop, 460, nTop + 240, 560, 0x303030 )
   GfxPrimitive( GFX_FILLEDCIRCLE, nTop + 40, 510, 32, 0xFF2020 )
   GfxPrimitive( GFX_FILLEDCIRCLE, nTop + 120, 510, 32, 0x604000 )
   GfxPrimitive( GFX_FILLEDCIRCLE, nTop + 200, 510, 32, 0x004010 )

   GfxPrimitive( GFX_RELEASESCREEN )

   Check( 'Center of the target        ', GfxPrimitive( GFX_GETPIXEL, nRow, 160 ), 0xFFE020 )
   Check( 'Edge of the red light       ', GfxPrimitive( GFX_GETPIXEL, nTop + 40, 542 ), 0xFF2020 )
   Check( 'Next to the red light       ', GfxPrimitive( GFX_GETPIXEL, nTop + 40, 543 ), 0x303030 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
